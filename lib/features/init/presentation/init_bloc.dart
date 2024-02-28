import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app_data/app_data.dart';
import '../../settings/domain/settings_service.dart';
import 'init.dart';

abstract class InitBloc extends State<InitPage> {
  final SettingsService _settingsService = SettingsService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await syncData();
    });
  }

  Future<void> syncData() async {
    await relocate();
  }

  Future<void> relocate() async {
    if (mounted) {
      if (_settingsService.getPrivateKey() == null) {
        context.push(AppData.routes.pincodeScreen);
      } else {
        // final result = await context.push<bool?>(AppData.routes.setCode);
        // if (result == true && mounted) {
        //   context.go(AppData.routes.homeScreen);
        // }
        
        await AppData.utils.importData(
            public: _settingsService.getPrivateKey()!, isNew: false);

        if (mounted) {
          context.go(AppData.routes.homeScreen);
        }
      }
    }
  }
}
