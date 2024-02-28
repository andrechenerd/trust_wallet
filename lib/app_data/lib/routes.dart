import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_wallet_desktop/features/auth/presentation/backup/backup.dart';
import 'package:trust_wallet_desktop/features/auth/presentation/import/import_phrase.dart';
import 'package:trust_wallet_desktop/features/auth/presentation/pincode/pincode.dart';
import 'package:trust_wallet_desktop/features/auth/presentation/secret_phrase/secret_phrase.dart';
import 'package:trust_wallet_desktop/features/auth/presentation/verify_phrase/verify_phrase.dart';
import 'package:trust_wallet_desktop/features/init/presentation/init.dart';
import 'package:trust_wallet_desktop/features/settings/presentation/import.dart';
import 'package:trust_wallet_desktop/features/settings/presentation/settings.dart';

import '../../features/auth/presentation/welcome/welcome.dart';
import '../../features/home/home.dart';
import '../app_data.dart';

final _routes = RoutesList();

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');

class RoutesList {
  final String init = '/';

  // PincodeScrren
  String get _pincodeScreenName => 'pincodeScreen';
  String get pincodeScreen => '$init$_pincodeScreenName';

  // WelcomeScreens
  String get _welcomeScreenName => 'welcome';
  String get welcomeScreen => '$init$_welcomeScreenName';

  // Back up screen
  String get _backupScreenName => 'backup';
  String get backupScreen => '$welcomeScreen/$_backupScreenName';

  // Import Key screen
  String get _importKeyScreenName => 'importKeyScreen';
  String get importKeyScreen => '$welcomeScreen/$_importKeyScreenName';

  // Your Secret Phrase screen
  String get _yourSecretPhraseScreenName => 'yourSecretPhrase';
  String get yourSecretPhraseScreen =>
      '$backupScreen/$_yourSecretPhraseScreenName';

  // Verify Phrase screen
  String get _verifyPhraseScreenName => 'verifyPhraseScreen';
  String get verifyPhraseScreen =>
      '$yourSecretPhraseScreen/$_verifyPhraseScreenName';

  // Create new wallet
  String get _createWalletScreenName => 'createWallet';
  String get createWalletScreenScreen =>
      '$welcomeScreen/$_createWalletScreenName';

  // Home

  String get _homeScreenName => 'homeScreen';
  String get homeScreen => '$init$_homeScreenName';

  // Settings

  String get _settingsScreenName => 'settingsScreen';
  String get settingsScreen => '$homeScreen/$_settingsScreenName';

  // IMport

  String get _importScreenName => 'importScreen';
  String get importScreen => '$settingsScreen/$_importScreenName';

  // Tx App

  String get _txAppScreenName => 'txAppScreen';
  String get txAppScreen => '$init$_txAppScreenName';
}

class Routes {
  Routes();

  String init = AppData.routes.txAppScreen;

  late final GoRouter routerConfig = GoRouter(
    navigatorKey: rootNavigator,
    initialLocation: init,
    routes: [
      GoRoute(
        path: AppData.routes.init,
        builder: (BuildContext context, GoRouterState state) {
          return const InitPage();
        },
        routes: [
          GoRoute(
            path: AppData.routes._pincodeScreenName,
            builder: (BuildContext context, GoRouterState state) {
              return const PinCodeScreen();
            },
            routes: const [],
          ),
          GoRoute(
            path: AppData.routes._welcomeScreenName,
            builder: (BuildContext context, GoRouterState state) {
              return const WelcomeScreen();
            },
            routes: [
              GoRoute(
                path: AppData.routes._backupScreenName,
                builder: (BuildContext context, GoRouterState state) {
                  return const BackUpScreen();
                },
                routes: [
                  GoRoute(
                    path: AppData.routes._yourSecretPhraseScreenName,
                    builder: (BuildContext context, GoRouterState state) {
                      return const YourSecretPhraseScreen();
                    },
                    routes: [
                      GoRoute(
                        path: AppData.routes._verifyPhraseScreenName,
                        builder: (BuildContext context, GoRouterState state) {
                          return VerifyPhraseScreen(
                            mnemonic: state.extra as List<String>,
                          );
                        },
                        routes: const [],
                      ),
                    ],
                  ),
                ],
              ),
              GoRoute(
                path: AppData.routes._importKeyScreenName,
                builder: (BuildContext context, GoRouterState state) {
                  return const ImportKeyScreen();
                },
                routes: const [],
              ),
            ],
          ),
          GoRoute(
            path: AppData.routes._homeScreenName,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
            routes: [
              GoRoute(
                path: AppData.routes._settingsScreenName,
                builder: (BuildContext context, GoRouterState state) {
                  return const SettingsScreen();
                },
                routes: [
                  GoRoute(
                    path: AppData.routes._importScreenName,
                    builder: (BuildContext context, GoRouterState state) {
                      return const ImportWalletScreen();
                    },
                    routes: const [],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      // GoRoute(
      //   path: AppData.routes.txAppScreen,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const SplashScreen();
      //   },
      // ),
    ],
  );
}
