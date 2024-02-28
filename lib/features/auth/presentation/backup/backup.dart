import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_wallet_desktop/app_data/app_data.dart';

class BackUpScreen extends StatefulWidget {
  const BackUpScreen({super.key});

  @override
  State<BackUpScreen> createState() => _BackUpScreenState();
}

class _BackUpScreenState extends State<BackUpScreen> {
  int selectedScreen = 0;

  Widget get body {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Back up your wallet now!",
          style: AppData.theme.text.s32w400,
        ),
        const SizedBox(height: 12),
        Text(
          "In the next step you will see Secret Phrase (12 words) that allows you to recover a wallet.",
          style: AppData.theme.text.s18w700.copyWith(
            color: AppData.colors.basicGray,
          ),
        ),
        const SizedBox(height: 50),
        AppData.assets.image.backup(),
        const SizedBox(height: 50),
        title(
          "If I lose my secret phrase, my funds will be lost forever.",
          0,
        ),
        const SizedBox(height: 12),
        title(
          "If I expose or share my secret phrase to anybody, my funds can get stolen.",
          1,
        ),
        const SizedBox(height: 12),
        title(
          "It is my full responsibility to keep my secret phrase secure.",
          2,
        ),
        const SizedBox(height: 60),
        TextButton(
          onPressed: () => context.push(AppData.routes.yourSecretPhraseScreen),
          child: const Text("CONTINUE"),
        ),
      ],
    );
  }

  Widget title(String text, int select) {
    return GestureDetector(
      onTap: () => setState(() {
        selectedScreen = select;
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 33),
        decoration: BoxDecoration(
          border: Border.all(
            color: select == selectedScreen
                ? AppData.colors.mainBlueColor
                : Colors.transparent,
            width: select == selectedScreen ? 1 : 0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: AppData.theme.text.s18w400.copyWith(
                color: AppData.colors.basicGray,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: select == selectedScreen
                      ? AppData.colors.mainBlueColor
                      : Colors.transparent,
                  width: select == selectedScreen ? 1 : 0,
                ),
              ),
              child: Container(
                color: select == selectedScreen
                    ? AppData.colors.mainBlueColor
                    : null,
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 200, vertical: 90),
          child: body,
        ),
      ),
    );
  }
}
