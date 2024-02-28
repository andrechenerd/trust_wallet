import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../../app_data/app_data.dart';
import '../../../widgets/custom_elevated_button.dart';

class VerifyPhraseScreen extends StatefulWidget {
  final List<String> mnemonic;
  const VerifyPhraseScreen({
    super.key,
    required this.mnemonic,
  });

  @override
  State<VerifyPhraseScreen> createState() => _YourSecretPhraseScreenState();
}

class _YourSecretPhraseScreenState extends State<VerifyPhraseScreen> {
  List<String> mainListString = List.generate(12, (index) => '');
  List<String> checkList = [];
  int selectedIndex = 0;

  bool arraysEqual = false;
  bool isLoading = false;
  @override
  void initState() {
    checkList = widget.mnemonic.toList();
    checkList.shuffle();
    super.initState();
  }

  bool get toCheckList {
    if (widget.mnemonic.length != mainListString.length) {
      arraysEqual = false;
    } else {
      for (int i = 0; i < widget.mnemonic.length; i++) {
        if (widget.mnemonic[i] != mainListString[i]) {
          arraysEqual = false;
          break;
        } else {
          arraysEqual = true;
        }
      }
      return arraysEqual;
    }
    return arraysEqual;
  }

  Future<void> toDone() async {
    setState(() {
      isLoading = true;
    });

    final res = await AppData.utils.importData(
      public: mainListString.join(" "),
      isNew: true,
      putPrivateKey: false,
    );
    if (res && mounted) {
      context.go(AppData.routes.homeScreen);
    }
    setState(() {
      isLoading = false;
    });
  }

  Widget get body {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Verify Secret Phrase",
          style: AppData.theme.text.s32w400,
        ),
        const SizedBox(height: 12),
        Text(
          "Tap the words to put them next to each other in the correct order.",
          style: AppData.theme.text.s18w700.copyWith(
            color: AppData.colors.basicGray,
          ),
        ),
        const SizedBox(height: 50),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
            color: Colors.white,
          ),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 12,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 24.0,
              mainAxisSpacing: 14.0,
              childAspectRatio: 4 / 1,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => setState(() {
                  selectedIndex = index;
                }),
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: selectedIndex == index
                      ? BoxDecoration(
                          border: Border.all(
                              color: AppData.colors.mainBlueColor, width: 1),
                          borderRadius: BorderRadius.circular(8),
                        )
                      : null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (index + 1).toString(),
                        style: AppData.theme.text.s14w400
                            .copyWith(color: AppData.colors.basicGray),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          mainListString[index],
                          style: AppData.theme.text.s14w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 50),
        GridView.builder(
          shrinkWrap: true,
          itemCount: 12,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: 24.0,
            mainAxisSpacing: 14.0,
            childAspectRatio: 4 / 1,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: mainListString.contains(checkList[index])
                  ? null
                  : () => setState(() {
                        mainListString[selectedIndex] = checkList[index];
                      }),
              child: Text(
                checkList[index],
                style: mainListString.contains(checkList[index])
                    ? AppData.theme.text.s14w400.copyWith(
                        color: AppData.colors.basicGray.withOpacity(0.5),
                      )
                    : AppData.theme.text.s14w400,
              ),
            );
          },
        ),
        const SizedBox(height: 287),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            children: [
              toCheckList
                  ? const Text(
                      "Well done",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    )
                  : Column(
                      children: [
                        TextButton(
                          onPressed: () async {
                            ClipboardData? clipboardData =
                                await Clipboard.getData(Clipboard.kTextPlain);
                            List<String> list = clipboardData!.text!.split(" ");
                            setState(() {
                              mainListString = List.generate(
                                12,
                                (index) => list[index],
                              );
                            });
                          },
                          child: const Text("Paste phrase"),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () => setState(() {
                            mainListString = List.generate(12, (index) => '');
                          }),
                          child: const Text("Clear list"),
                        ),
                      ],
                    ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                text: isLoading ? "Loading..." : "DONE",
                onPress: toCheckList && !isLoading ? toDone : null,
              ),
            ],
          ),
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
