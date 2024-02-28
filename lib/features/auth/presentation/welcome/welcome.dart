import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_wallet_desktop/app_data/app_data.dart';

import '../../../widgets/custom_elevated_button.dart';
import 'welcome_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends WelcomeBloc {
  Widget get header {
    switch (selectedScreen) {
      case 0:
        return Column(
          children: [
            AppData.assets.image.welcome(),
            const SizedBox(height: 80),
            Text(
              "Private and secure",
              style: AppData.theme.text.s32w400,
            ),
            const SizedBox(height: 12),
            Text(
              "Private keys never leave your device.",
              style: AppData.theme.text.s18w700
                  .copyWith(color: AppData.colors.basicGray),
            ),
          ],
        );
      case 1:
        return Column(
          children: [
            AppData.assets.image.welcome1(),
            const SizedBox(height: 80),
            Text(
              "All assets in one place",
              style: AppData.theme.text.s32w400,
            ),
            const SizedBox(height: 12),
            Text(
              "View and store your assets seamlessly",
              style: AppData.theme.text.s18w700
                  .copyWith(color: AppData.colors.basicGray),
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            AppData.assets.image.welcome2(),
            const SizedBox(height: 80),
            Text(
              "Trade assets",
              style: AppData.theme.text.s32w400,
            ),
            const SizedBox(height: 12),
            Text(
              "Trade your assets anonymously.",
              style: AppData.theme.text.s18w700
                  .copyWith(color: AppData.colors.basicGray),
            ),
          ],
        );
      case 3:
        return Column(
          children: [
            AppData.assets.image.welcome3(),
            const SizedBox(height: 80),
            Text(
              "Explore decentralized apps",
              style: AppData.theme.text.s32w400,
            ),
            const SizedBox(height: 12),
            Text(
              "Earn, explore, utilize, spend, trade, and more.",
              style: AppData.theme.text.s18w700
                  .copyWith(color: AppData.colors.basicGray),
            ),
          ],
        );
      default:
        return Container();
    }
  }

  Widget get body {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        header,
        const SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 350),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 6,
                backgroundColor: selectedScreen == 0
                    ? AppData.colors.mainBlueColor
                    : Colors.transparent,
              ),
              CircleAvatar(
                radius: 6,
                backgroundColor: selectedScreen == 1
                    ? AppData.colors.mainBlueColor
                    : Colors.transparent,
              ),
              CircleAvatar(
                radius: 6,
                backgroundColor: selectedScreen == 2
                    ? AppData.colors.mainBlueColor
                    : Colors.transparent,
              ),
              CircleAvatar(
                radius: 6,
                backgroundColor: selectedScreen == 3
                    ? AppData.colors.mainBlueColor
                    : Colors.transparent,
              ),
            ],
          ),
        ),
        const SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: CustomElevatedButton(
            text: "CREATE A NEW WALLET",
            onPress: () => setState(() {
              if (selectedScreen < 3) {
                selectedScreen++;
              } else {
                context.push(AppData.routes.backupScreen);
              }
            }),
          ),
        ),
        const SizedBox(height: 30),
        TextButton(
          onPressed: () => context.push(AppData.routes.importKeyScreen),
          child: const Text("I already have a wallet"),
        ),
      ],
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
