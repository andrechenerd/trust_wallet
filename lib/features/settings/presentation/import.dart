import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../app_data/app_data.dart';
import '../../widgets/custom_elevated_button.dart';

class ImportWalletScreen extends StatefulWidget {
  const ImportWalletScreen({super.key});

  @override
  State<ImportWalletScreen> createState() => _ImportWalletScreenState();
}

class _ImportWalletScreenState extends State<ImportWalletScreen> {
  final TextEditingController privateKey = TextEditingController();

  bool arraysEqual = false;
  bool isLoading = false;
  bool get toCheckKey {
    if (privateKey.text.isEmpty) {
      print("empty");
      setState(() {
        arraysEqual = false;
      });
    } else {
      print("notEmpty");
      setState(() {
        arraysEqual = true;
      });
    }
    return arraysEqual;
  }

  Future<void> toDone(bool? putPrivate) async {
    setState(() {
      isLoading = true;
    });
    try {
      final res = await AppData.utils.importData(
        public: privateKey.text,
        isNew: false,
        putPrivateKey: putPrivate,
      );
      if (res && mounted) {
        context.go(AppData.routes.homeScreen);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  int selectedScreen = 0;
  Widget text({
    required String text,
    required int index,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => setState(() {
          privateKey.clear();
          selectedScreen = index;
        }),
        child: Column(
          children: [
            Text(
              text,
              style: selectedScreen == index
                  ? AppData.theme.text.s18w400.copyWith(color: Colors.white)
                  : AppData.theme.text.s18w400.copyWith(
                      color: Colors.white.withOpacity(0.5),
                    ),
            ),
            const SizedBox(height: 15),
            selectedScreen == index
                ? Container(
                    height: 2,
                    width: 100,
                    color: Colors.white,
                  )
                : const SizedBox(
                    height: 2,
                  ),
          ],
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
            "Import",
            style: AppData.theme.text.s18w700.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: AppData.colors.mainBlueColor,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                text(
                  index: 0,
                  text: "PHRASPE",
                ),
                text(
                  index: 1,
                  text: "RIVATE KEY",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: selectedScreen == 0
                            ? "Your phrase"
                            : "Your private key",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppData.colors.mainBlueColor,
                            width: 1,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppData.colors.mainBlueColor,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppData.colors.mainBlueColor,
                            width: 1,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppData.colors.mainBlueColor,
                            width: 1,
                          ),
                        ),
                        suffix: TextButton(
                          onPressed: () async {
                            ClipboardData? clipboardData =
                                await Clipboard.getData(Clipboard.kTextPlain);
                            setState(() {
                              privateKey.text = clipboardData!.text!;
                            });
                          },
                          child: Text(
                            "PASTE",
                            style: AppData.theme.text.s16w400.copyWith(
                              color: AppData.colors.mainBlueColor,
                            ),
                          ),
                        ),
                      ),
                      onChanged: (value) => setState(() {
                        privateKey.text = value;
                      }),
                      controller: privateKey,
                    ),
                    const SizedBox(height: 34),
                    Text(
                      selectedScreen == 0
                          ? "Typically 12 (sometimes 24) words separated by single spaces"
                          : "Typically 64 alphanumeric characters",
                      style: AppData.theme.text.s18w400.copyWith(
                        color: AppData.colors.basicGray,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 250),
                SizedBox(
                  width: 600,
                  child: CustomElevatedButton(
                    text: isLoading ? "Loading..." : "IMPORT",
                    onPress: toCheckKey && !isLoading
                        ? () => toDone(selectedScreen == 0 ? false : true)
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
