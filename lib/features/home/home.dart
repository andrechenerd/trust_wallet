import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_wallet_desktop/app_data/app_data.dart';

import 'home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends HomeBloc {
  Widget iconButton({
    required String text,
    required bool isHover,
    required Widget icon,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => setState(() {
        setState(() {
          isHover = true;
        });
      }),
      onExit: (event) => setState(() {
        setState(() {
          isHover = false;
        });
      }),
      onHover: (event) => setState(() {
        setState(() {
          isHover = true;
        });
      }),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: isHover
                  ? Colors.white.withOpacity(0.4)
                  : Colors.white.withOpacity(0.1),
              child: icon,
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: AppData.theme.text.s12w500.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppData.colors.mainBlueColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 54, left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        authService.getWallet().toString(),
                        style: AppData.theme.text.s22w500
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        authService.getSelectCurrency()!.name,
                        style: AppData.theme.text.s18w500
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () =>
                        context.push(AppData.routes.settingsScreen),
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            selectedCrypt == null
                ? Text(
                    "Wallet 1",
                    style: AppData.theme.text.s18w700
                        .copyWith(color: Colors.white),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 21,
                        child: AppData.assets.image.crypto(
                          value: selectedCrypt!.iconName,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        selectedCrypt!.shortName,
                        style: AppData.theme.text.s18w400
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "${authService.getSelectCurrency()!.symbol}${selectedCrypt!.amountInCurrency}",
                        style: AppData.theme.text.s18w400
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
            const SizedBox(height: 52),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                iconButton(
                  text: "Send",
                  isHover: isSendHover,
                  icon: AppData.assets.image.send(),
                ),
                iconButton(
                  text: "Receive",
                  isHover: isReceiveHover,
                  icon: AppData.assets.image.receive(),
                ),
                iconButton(
                  text: "Buy",
                  isHover: isBuyHover,
                  icon: AppData.assets.image.buy(),
                ),
              ],
            ),
            const SizedBox(height: 34),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: selectedCrypt == null
                  ? Column(
                      children: [
                        const SizedBox(height: 33),
                        Text(
                          "Tokens",
                          style: AppData.theme.text.s18w700,
                        ),
                        const SizedBox(height: 33),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 14),
                          // height: 400,
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => setState(() {
                                  selectedCrypt = crypts![index];
                                }),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 30,
                                      child: AppData.assets.image.crypto(
                                        value: crypts![index].iconName,
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      flex: 10,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            crypts![index].name,
                                            style: AppData.theme.text.s18w400,
                                          ),
                                          Text(
                                            "${authService.getSelectCurrency()!.symbol}${crypts![index].amountInCurrency}",
                                            style: AppData.theme.text.s18w400
                                                .copyWith(
                                              color: AppData.colors.basicGray,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "${crypts![index].amount} ${crypts![index].shortName}",
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: crypts!.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 14),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 95),
                          AppData.assets.image.home(),
                          const SizedBox(height: 28),
                          Text(
                            "Transactions will appear here",
                            style: AppData.theme.text.s18w700.copyWith(
                              color: AppData.colors.basicGray,
                            ),
                          ),
                          const SizedBox(height: 28),
                          TextButton(
                            onPressed: () =>
                                context.push(AppData.routes.settingsScreen),
                            child: Text(
                              "Buy ${selectedCrypt!.shortName}",
                              style: AppData.theme.text.s16w400.copyWith(
                                color: AppData.colors.mainBlueColor,
                              ),
                            ),
                          ),
                          const SizedBox(height: 300),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 100,
        padding: const EdgeInsets.symmetric(vertical: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => setState(() {
                  selectedCrypt = null;
                }),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shield,
                      color: AppData.colors.mainBlueColor,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Wallet",
                      style: AppData.theme.text.s18w500.copyWith(
                        color: AppData.colors.mainBlueColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.push(AppData.routes.settingsScreen),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      color: AppData.colors.basicGray,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Settings",
                      style: AppData.theme.text.s18w500.copyWith(
                        color: AppData.colors.basicGray,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
