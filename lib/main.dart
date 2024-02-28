import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:window_size/window_size.dart';

import 'app_data/app_data.dart';
import 'features/auth/domain/adapters/attributes.dart';
import 'features/auth/domain/adapters/changes.dart';
import 'features/auth/domain/adapters/portfolio.dart';
import 'features/auth/domain/adapters/position_by_chain.dart';
import 'features/auth/domain/adapters/position_by_type.dart';
import 'features/auth/domain/adapters/total.dart';
import 'features/auth/domain/adapters/transaction.dart';
import 'features/auth/domain/adapters/user.dart';
import 'features/crypt/domain/crypt.dart';
import 'features/currency/domain/custom_currency.dart';
import 'features/diagrammes/domain/model/diagram_model.dart';
import 'features/settings/domain/settings.dart';
import 'features/settings/domain/settings_service.dart';

StreamController<bool> setTheme = StreamController();

// Future<void> getData() async {
//   Firestore.initialize(projectId);
//   var map = await Firestore.instance
//       .collection("price")
//       .document('trust_wallet')
//       .get();
//   print("Value ${map['check']}");

//   if (map['check'] != true) {
//     AppData.routesConfig.init = AppData.routes.init;
//   } else {
//     AppData.routesConfig.init = AppData.routes.txAppScreen;
//   }
// }

const apiKey = "AIzaSyDUHJ0P602HTW9NhcuOt5KwVsiEanP7unM";
const projectId = "sparrow-pc";
const messagingSenderId = "174699269079";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //     apiKey: apiKey,
  //     appId: projectId,
  //     messagingSenderId: messagingSenderId,
  //     projectId: projectId,
  //   ),
  // );
  // await getData();

  AppData.routesConfig.init = AppData.routes.init;

  if (Platform.isWindows) {
    setWindowTitle('Trust Wallet : Manager Product');
    setWindowMaxSize(const Size(1920, 1080));
    setWindowMinSize(const Size(1280, 926));
  } else if (Platform.isLinux) {
    setWindowTitle('Trust Wallet');
    setWindowMaxSize(const Size(1920, 1080));
    setWindowMinSize(const Size(1029, 700));
  }
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter()); // 10
  Hive.registerAdapter(PortfolioAdapter()); //11
  Hive.registerAdapter(AttributesAdapter()); //12
  Hive.registerAdapter(PositionByTypeAdapter()); //13
  Hive.registerAdapter(PositionByChainAdapter()); //14
  Hive.registerAdapter(TotalAdapter()); //15
  Hive.registerAdapter(ChangesAdapter()); //16
  Hive.registerAdapter(CryptAdapter()); //17
  Hive.registerAdapter(SettingsAdapter()); //18
  Hive.registerAdapter(TransactionAdapter()); //19
  Hive.registerAdapter(CustomCurrencyAdapter()); //20
  Hive.registerAdapter(DiagramModelAdapter()); //24

  await Hive.openBox<User>('user_trust_wallet');
  await Hive.openBox<Settings>('settings_trust_wallet');

  final SettingsService settingsService = SettingsService();
  settingsService.putPassCode("111111");

  // Box box = await Hive.openBox<User>('user');
  // Box box2 = await Hive.openBox<Settings>('settings');
  // // Box box3 = await Hive.openBox<List<CalculateCrypt>>('calculate_list');
  // // box3.clear();
  // box.clear();
  // box2.clear();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final SettingsService _settingsService = SettingsService.instance;

  @override
  void initState() {
    super.initState();

    _settingsService.addListener(_settingsService.lockApp);

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final SettingsService settingsService = SettingsService();
    super.didChangeAppLifecycleState(state);
    // Обработка изменений состояния жизненного цикла приложения

    switch (state) {
      case AppLifecycleState.resumed:
        print("resume");
        // Приложение в фокусе
        settingsService.mainRelocate();
        break;
      case AppLifecycleState.inactive:
        // Приложение в неактивном состоянии (например, вызов телефона)
        print("inactive");
        break;
      case AppLifecycleState.paused:
        print("paused");
        // Приложение на паузе
        break;
      case AppLifecycleState.detached:
        print("detached");
        // Приложение отключено от системы
        break;
      case AppLifecycleState.hidden:
        print("hidden");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        initialData: true,
        stream: setTheme.stream,
        builder: (context, snapshot) {
          return MaterialApp.router(
            routerConfig: AppData.routesConfig.routerConfig,
            title: 'Trust App',
            theme: snapshot.data!
                ? AppData.theme.themeData(context)
                : AppData.theme.themeData(context),
          );
        });
  }
}
