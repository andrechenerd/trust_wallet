import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:trust_wallet_desktop/features/auth/presentation/pincode/domain/error_enum.dart';

import '../../../../app_data/app_data.dart';
import '../../../widgets/custom_elevated_button.dart';
import 'pincode_bloc.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends PinCodeBloc {
  Widget get body {
    return Column(
      children: [
        AppData.assets.image.trust(),
        const SizedBox(height: 28),
        Text(
          "Set a new Passcode",
          style: AppData.theme.text.s32w400,
        ),
        const SizedBox(height: 12),
        Text(
          "This passcode is used to protect your wallet and provide access to the browser extension.",
          style: AppData.theme.text.s18w700
              .copyWith(color: AppData.colors.basicGray),
        ),
        const SizedBox(height: 64),
        Text(
          "Enter a new passcode",
          style: AppData.theme.text.s16w400
              .copyWith(color: AppData.colors.basicGray),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 160),
          child: PinCodeTextField(
            focusNode: focusNode1,
            textInputAction: TextInputAction.next,
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            textStyle: AppData.theme.text.s32w400.copyWith(
              color: isPinCodeSuccess == ErrorPinCode.isSuccess
                  ? Colors.green
                  : isPinCodeSuccess == ErrorPinCode.isError
                      ? AppData.colors.red040
                      : AppData.colors.mainBlueColor,
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8),
              fieldHeight: 60,
              fieldWidth: 60,
              activeFillColor: Colors.white,
              inactiveFillColor: Colors.white,
              inactiveColor: AppData.colors.mainBlueColor.withOpacity(0.2),
              activeColor: isPinCodeSuccess == ErrorPinCode.isSuccess
                  ? Colors.green
                  : AppData.colors.mainBlueColor,
              selectedFillColor: AppData.colors.mainBlueColor.withOpacity(0.1),
              errorBorderColor: isPinCodeSuccess == ErrorPinCode.isError
                  ? AppData.colors.red040
                  : AppData.colors.mainBlueColor,
              errorBorderWidth: 1,
              activeBorderWidth: 1,
              inactiveBorderWidth: 2,
            ),
            animationDuration: const Duration(milliseconds: 300),
            enableActiveFill: true,
            errorAnimationController: pinCodeTextErrorCtrl,
            controller: pinCodeTextCtrl,
            onCompleted: (v) {
              if (pinCodeTextCtrlConfirm.text.isEmpty) {
              } else if ((pinCodeTextCtrlConfirm.text ==
                      pinCodeTextCtrl.text) &&
                  pinCodeTextCtrlConfirm.text.length == 6) {
                pinCodeTextErrorCtrl!.add(ErrorAnimationType.clear);
                pinCodeTextErrorCtrlConfirm!.add(ErrorAnimationType.clear);
                setState(
                  () {
                    isPinCodeSuccess = ErrorPinCode.isSuccess;
                    snackBar(
                      "Pincode verified!",
                      Colors.green,
                    );
                  },
                );
              } else {
                pinCodeTextErrorCtrl!.add(ErrorAnimationType.shake);
                pinCodeTextErrorCtrlConfirm!.add(ErrorAnimationType.shake);
                setState(() {
                  isPinCodeSuccess = ErrorPinCode.isError;
                  snackBar(
                    "PIN codes do not match!",
                    AppData.colors.red040,
                  );
                });
              }
              changeFocus(focusNode2);
            },
            onChanged: (value) {
              print(value);
              setState(() {
                isPinCodeSuccess = ErrorPinCode.isNotCompleted;
              });
            },
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
            appContext: context,
          ),
        ),
        const SizedBox(height: 52),
        Text(
          "Please re-enter your passcode",
          style: AppData.theme.text.s16w400
              .copyWith(color: AppData.colors.basicGray),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 160),
          child: PinCodeTextField(
            focusNode: focusNode2,
            textInputAction: TextInputAction.next,
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            textStyle: AppData.theme.text.s32w400.copyWith(
              color: isPinCodeSuccess == ErrorPinCode.isSuccess
                  ? Colors.green
                  : isPinCodeSuccess == ErrorPinCode.isError
                      ? AppData.colors.red040
                      : AppData.colors.mainBlueColor,
            ),
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8),
              fieldHeight: 60,
              fieldWidth: 60,
              activeFillColor: Colors.white,
              inactiveFillColor: Colors.white,
              inactiveColor: AppData.colors.mainBlueColor.withOpacity(0.2),
              activeColor: isPinCodeSuccess == ErrorPinCode.isSuccess
                  ? Colors.green
                  : AppData.colors.mainBlueColor,
              selectedFillColor: AppData.colors.mainBlueColor.withOpacity(0.1),
              errorBorderColor: isPinCodeSuccess == ErrorPinCode.isError
                  ? AppData.colors.red040
                  : AppData.colors.mainBlueColor,
              errorBorderWidth: 1,
              activeBorderWidth: 1,
              inactiveBorderWidth: 2,
            ),
            animationDuration: const Duration(milliseconds: 300),
            enableActiveFill: true,
            errorAnimationController: pinCodeTextErrorCtrlConfirm,
            controller: pinCodeTextCtrlConfirm,
            onCompleted: (v) {
              if ((pinCodeTextCtrlConfirm.text == pinCodeTextCtrl.text) &&
                  pinCodeTextCtrlConfirm.text.length == 6) {
                pinCodeTextErrorCtrl!.add(ErrorAnimationType.clear);
                pinCodeTextErrorCtrlConfirm!.add(ErrorAnimationType.clear);
                setState(
                  () {
                    isPinCodeSuccess = ErrorPinCode.isSuccess;
                    snackBar(
                      "Pincode verified!",
                      Colors.green,
                    );
                  },
                );
              } else {
                pinCodeTextErrorCtrl!.add(ErrorAnimationType.shake);
                pinCodeTextErrorCtrlConfirm!.add(ErrorAnimationType.shake);
                setState(() {
                  isPinCodeSuccess = ErrorPinCode.isError;
                  snackBar(
                    "PIN codes do not match!",
                    AppData.colors.red040,
                  );
                });
              }
              changeFocus(null);
            },
            onChanged: (value) {
              print(value);
              setState(() {
                isPinCodeSuccess = ErrorPinCode.isNotCompleted;
              });
            },
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
            appContext: context,
          ),
        ),
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: CustomElevatedButton(
            text: "Next",
            onPress: isPinCodeSuccess == ErrorPinCode.isSuccess ? goNext : null,
          ),
        ),
        const SizedBox(height: 30),
        TextButton(
          onPressed: () {},
          child: const Text("Back"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 240, vertical: 90),
          child: body,
        ),
      ),
    );
  }
}
