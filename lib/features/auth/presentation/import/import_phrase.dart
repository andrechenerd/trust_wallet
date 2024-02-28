import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../../app_data/app_data.dart';
import '../../../widgets/custom_elevated_button.dart';

class ImportKeyScreen extends StatefulWidget {
  const ImportKeyScreen({super.key});

  @override
  State<ImportKeyScreen> createState() => _YourSecretPhraseScreenState();
}

class _YourSecretPhraseScreenState extends State<ImportKeyScreen> {
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

  Future<void> toDone() async {
    setState(() {
      isLoading = true;
    });
    final res = await AppData.utils.importData(
      public: privateKey.text,
      isNew: true,
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
          "Import Private Key",
          style: AppData.theme.text.s32w400,
        ),
        const SizedBox(height: 12),
        Text(
          "Import your wallet by private key",
          style: AppData.theme.text.s18w700.copyWith(
            color: AppData.colors.basicGray,
          ),
        ),
        const SizedBox(height: 50),
        TextFormField(
          decoration: const InputDecoration(
            hintText: "Your privae key",
          ),
          onChanged: (value) => setState(() {
            privateKey.text = value;
          }),
          controller: privateKey,
        ),
        const SizedBox(height: 287),
        TextButton(
          onPressed: () async {
            ClipboardData? clipboardData =
                await Clipboard.getData(Clipboard.kTextPlain);
            setState(() {
              privateKey.text = clipboardData!.text!;
            });
          },
          child: const Text("Paste phrase"),
        ),
        const SizedBox(height: 50),
        CustomElevatedButton(
          text: isLoading ? "Loading..." : "IMPORT",
          onPress: toCheckKey && !isLoading ? toDone : null,
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
