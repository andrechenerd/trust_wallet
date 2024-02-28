import 'package:flutter/material.dart';
import 'package:bip39_mnemonic/bip39_mnemonic.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../../app_data/app_data.dart';
import '../../../widgets/custom_elevated_button.dart';

class YourSecretPhraseScreen extends StatefulWidget {
  const YourSecretPhraseScreen({super.key});

  @override
  State<YourSecretPhraseScreen> createState() => _YourSecretPhraseScreenState();
}

class _YourSecretPhraseScreenState extends State<YourSecretPhraseScreen> {
  Mnemonic? mnemonic;

  @override
  void initState() {
    mnemonic = Mnemonic.generate(
      Language.english,
      passphrase: "Something",
      entropyLength: 128,
    );
    super.initState();
  }

  Widget get body {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Your Secret Phrase",
          style: AppData.theme.text.s32w400,
        ),
        const SizedBox(height: 12),
        Text(
          "Write down or copy these words in the right order and save them somewhere safe.",
          style: AppData.theme.text.s18w700.copyWith(
            color: AppData.colors.basicGray,
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
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (index + 1).toString(),
                  style: AppData.theme.text.s14w400
                      .copyWith(color: AppData.colors.basicGray),
                ),
                const SizedBox(width: 8),
                Text(
                  mnemonic!.words[index],
                  style: AppData.theme.text.s14w400,
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 60),
        TextButton(
          onPressed: () =>
              Clipboard.setData(ClipboardData(text: mnemonic!.sentence)).then(
            (value) {
              //only if ->
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Copied!")));
            },
          ),
          child: const Text("COPY"),
        ),
        const SizedBox(height: 287),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppData.colors.red040.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: [
                    Text(
                      "Do not share your secret phrase!",
                      style: AppData.theme.text.s18w400.copyWith(
                        color: AppData.colors.red040,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "If someone has your secret phrase, they will have full control of your wallet.",
                      style: AppData.theme.text.s16w400.copyWith(
                        color: AppData.colors.red040,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                text: "CONTINUE",
                onPress: () {
                  List<String> mnemonicList = mnemonic!.sentence.split(' ');
                  context.push(
                    AppData.routes.verifyPhraseScreen,
                    extra: mnemonicList,
                  );
                },
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
