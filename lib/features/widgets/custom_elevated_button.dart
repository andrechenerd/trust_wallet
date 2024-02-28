import 'package:flutter/material.dart';

import '../../app_data/app_data.dart';

class CustomElevatedButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPress;
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  bool isHover = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHover = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: ElevatedButton(
        onPressed: widget.onPress,
        style: isHover
            ? AppData.theme.button.defaultElevatedButton(
                AppData.colors.mainBlueColor.withOpacity(0.95),
              )
            : AppData.theme.button
                .defaultElevatedButton(AppData.colors.mainBlueColor),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              widget.text.toUpperCase(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
