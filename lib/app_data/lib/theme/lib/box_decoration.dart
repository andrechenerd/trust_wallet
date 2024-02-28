import 'package:flutter/material.dart';

class BoxDecorationThemeCollection {
  BoxDecorationThemeCollection();

  BoxDecoration get inputPasswordOnBlackBackground => BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      );

  InputDecoration get textFiledDecoration => InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.black54,
            width: 1.5,
          ),
        ),
        hintText: 'Email',
      );
}
