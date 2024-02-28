import 'package:flutter/material.dart';

import '../../app_data.dart';
import 'lib/box_decoration.dart';
import 'lib/button_theme.dart';
import 'lib/text_theme.dart';

class AppTheme {
  AppTheme();

  TextThemeCollection get text => TextThemeCollection();

  ButtonThemeCollection get button => ButtonThemeCollection();

  BoxDecorationThemeCollection get boxDecoration =>
      BoxDecorationThemeCollection();

  InputBorder get inputBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: AppData.colors.gray200,
        ),
        borderRadius: BorderRadius.circular(4),
      );

  ThemeData themeData(BuildContext context) => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppData.colors.backgroundColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
          secondary: Colors.white,
        ),
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          backgroundColor: AppData.colors.mainBlueColor,
          surfaceTintColor: AppData.colors.mainBlueColor,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppData.colors.textColor,
              displayColor: AppData.colors.textColor,
              fontFamily: AppData.theme.text.fontFamily,
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: AppData.theme.button
              .defaultElevatedButton(AppData.colors.mainBlueColor),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: AppData.theme.button.outlinedButton,
        ),
        textButtonTheme: TextButtonThemeData(
          style: AppData.theme.button.defaultTextButton,
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.grey[500],
          selectionColor: Colors.grey[500],
        ),
        appBarTheme: AppBarTheme(
          surfaceTintColor: AppData.colors.backgroundColor,
          backgroundColor: AppData.colors.mainBlueColor,
          titleTextStyle: AppData.theme.text.s14w700.copyWith(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: AppData.theme.text.fontFamily,
          ),
        ),
        checkboxTheme: const CheckboxThemeData(
          side: BorderSide(color: Colors.grey),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: AppData.colors.textColor,
          ),
          hintStyle: TextStyle(
            color: AppData.colors.textColor,
          ),
          prefixIconColor: AppData.colors.textColor,
          suffixIconColor: AppData.colors.textColor,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: AppData.theme.button.defaultIconButton,
        ),
      );
}
