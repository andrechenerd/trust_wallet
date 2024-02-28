import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_wallet_desktop/app_data/app_data.dart';
import 'package:trust_wallet_desktop/features/settings/domain/settings_service.dart';

import '../../../main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsService settingsService = SettingsService();
  bool? isSwitch;
  @override
  void initState() {
    isSwitch = settingsService.getTheme();
    super.initState();
  }

  Widget itemSettings({
    required VoidCallback onTap,
    required Widget icon,
    required String title,
    required Widget right,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 13),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 13),
              Expanded(
                child: Text(
                  title,
                  style: AppData.theme.text.s18w700,
                ),
              ),
              right,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 31),
          child: Text(
            "Settings",
            style: AppData.theme.text.s18w700.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          itemSettings(
            onTap: () => context.push(AppData.routes.importScreen),
            icon: AppData.assets.svg.wallet,
            title: "Wallets",
            right: Row(
              children: [
                Text(
                  "Wallet 1",
                  style: AppData.theme.text.s18w400.copyWith(
                    color: AppData.colors.basicGray,
                  ),
                ),
                const SizedBox(width: 20),
                Icon(
                  Icons.navigate_next,
                  color: AppData.colors.basicGray,
                ),
              ],
            ),
          ),
          itemSettings(
            onTap: () {},
            icon: AppData.assets.svg.dark,
            title: "Dark Mode",
            right: Switch(
              value: isSwitch!,
              onChanged: (value) => setState(() {
                isSwitch = !isSwitch!;
                settingsService.putTheme(true);
                setTheme.add(settingsService.getTheme()!);
              }),
            ),
          ),
          itemSettings(
            onTap: () {},
            icon: AppData.assets.svg.security,
            title: "Security",
            right: Icon(
              Icons.navigate_next,
              color: AppData.colors.basicGray,
            ),
          ),
          itemSettings(
            onTap: () {},
            icon: AppData.assets.svg.push,
            title: "Push Notifications",
            right: Icon(
              Icons.navigate_next,
              color: AppData.colors.basicGray,
            ),
          ),
          itemSettings(
            onTap: () {},
            icon: AppData.assets.svg.price,
            title: "Price Alerts",
            right: Icon(
              Icons.navigate_next,
              color: AppData.colors.basicGray,
            ),
          ),
          itemSettings(
            onTap: () {},
            icon: AppData.assets.svg.walletConnected,
            title: "WalletConnect",
            right: Icon(
              Icons.navigate_next,
              color: AppData.colors.basicGray,
            ),
          ),
        ],
      ),
    );
  }
}
