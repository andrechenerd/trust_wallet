import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:trust_wallet_desktop/app_data/app_data.dart';
import 'package:trust_wallet_desktop/features/auth/presentation/pincode/domain/error_enum.dart';

import '../../../settings/domain/settings_service.dart';
import 'pincode.dart';

abstract class PinCodeBloc extends State<PinCodeScreen> {
  final SettingsService settingsService = SettingsService();

  TextEditingController pinCodeTextCtrl = TextEditingController();
  StreamController<ErrorAnimationType>? pinCodeTextErrorCtrl;

  TextEditingController pinCodeTextCtrlConfirm = TextEditingController();
  StreamController<ErrorAnimationType>? pinCodeTextErrorCtrlConfirm;

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();

  ErrorPinCode isPinCodeSuccess = ErrorPinCode.isNotCompleted;

  @override
  void initState() {
    pinCodeTextErrorCtrl = StreamController<ErrorAnimationType>();
    pinCodeTextErrorCtrlConfirm = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    pinCodeTextErrorCtrl!.close();
    pinCodeTextErrorCtrlConfirm!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message, Color color) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppData.colors.mainBlueColor,
        content: Text(
          message!,
          style: AppData.theme.text.s20w700.copyWith(color: color),
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void changeFocus(FocusNode? node) {
    if (node != null) {
      FocusScope.of(context).requestFocus(node);
    } else {
      FocusScope.of(context).unfocus();
    }
  }

  void goNext() {
    settingsService.putPassCode(pinCodeTextCtrlConfirm.text);
    context.go(AppData.routes.welcomeScreen);
  }
}
