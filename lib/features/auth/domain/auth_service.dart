import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../crypt/domain/crypt.dart';
import '../../currency/domain/custom_currency.dart';
import 'adapters/position_by_chain.dart';
import 'adapters/transaction.dart';
import 'adapters/user.dart';

class AuthService {
  static final AuthService instance =
      GetIt.I.registerSingleton(AuthService._());
  final String boxName = 'user_trust_wallet';
  Box<User>? box;

  void boxClear() {
    box!.clear();
  }

  void putUser(User user) {
    box!.put(boxName, user);
  }

  User? getUser() {
    return box!.get(boxName);
  }

  void putAddress(String address) {
    User? user = getUser();
    if (user != null) {
      user.address = address;
      putUser(user);
    }
  }

  String? getAddress() {
    User? user = getUser();
    if (user != null) {
      return user.address;
    }
    return null;
  }

  CustomCurrency? getSelectCurrency() {
    List<CustomCurrency>? currencies = getCurrencies();
    return currencies.firstWhere((element) => element.isChoose == true);
  }

  void setSelectCurrency(CustomCurrency currency) {
    User? user = getUser();
    if (user != null) {
      CustomCurrency oldCurrency = getSelectCurrency()!;
      oldCurrency.isChoose = false;
      currency.isChoose = true;
      putUser(user);
    }
  }

  void putCurrency(List<CustomCurrency> currencies) {
    User? user = getUser();
    if (user != null) {
      user.currencies = currencies;
      putUser(user);
    }
  }

  List<CustomCurrency> getCurrencies() {
    User? user = getUser();
    if (user != null) {
      return user.currencies;
    }
    return [];
  }

  PositionByChain? getPositionByChain() {
    User? user = getUser();
    if (user != null) {
      return user.portfolio.attributes.positionsDistributionByChain;
    }
    return null;
  }

  void putCrypts(List<Crypt>? crypts) {
    User? user = getUser();
    if (user != null) {
      user.portfolio.attributes.positionsDistributionByChain.crypts = crypts!;
      putUser(user);
    }
  }

  Crypt? getCryptByName(String name) {
    User? user = getUser();
    if (user != null) {
      return user.portfolio.attributes.positionsDistributionByChain.crypts
          .firstWhere((crypt) => crypt.name == name);
    }
    return null;
  }

  List<Crypt>? getCrypts() {
    User? user = getUser();
    if (user != null) {
      return user.portfolio.attributes.positionsDistributionByChain.crypts;
    }
    return null;
  }

  List<Crypt> getCryptsByCryptsName(List<String> cryptsName) {
    User? user = getUser();
    if (user != null) {
      List<Crypt> mainList = [];
      for (int i = 0; cryptsName.length > i; i++) {
        Crypt crypt = user
            .portfolio.attributes.positionsDistributionByChain.crypts
            .firstWhere(
          (crypt) => crypt.iconName == cryptsName[i],
        );
        mainList.add(crypt);
      }
      log("mainList $mainList");
      return mainList;
    }
    return [];
  }

  Crypt? getETH() {
    User? user = getUser();
    if (user != null) {
      return user.portfolio.attributes.positionsDistributionByChain.crypts
          .firstWhere((eth) => eth.name == "Ethereum");
    }
    return null;
  }

  List<Crypt>? getTrueCrypts() {
    User? user = getUser();
    if (user != null) {
      return user.portfolio.attributes.positionsDistributionByChain.crypts
          .where((crypt) => crypt.isChoose)
          .toList();
    }
    return null;
  }

  double? getWallet() {
    User? user = getUser();
    if (user != null) {
      return user.portfolio.attributes.positionsDistributionByType.wallet;
    }
    return null;
  }

  double? getChangesAbsoluteWallet() {
    User? user = getUser();
    if (user != null) {
      return user.portfolio.attributes.changes.absoluteId;
    }
    return null;
  }

  List<Transaction>? getTransactions() {
    User? user = getUser();
    if (user != null) {
      return user.transactions;
    }
    return null;
  }

  AuthService._() {
    box = Hive.box<User>(boxName);
  }

  factory AuthService() => instance;
}
