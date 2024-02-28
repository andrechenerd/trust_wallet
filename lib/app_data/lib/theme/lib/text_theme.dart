import 'package:flutter/material.dart';

import '../../../app_data.dart';

class TextThemeCollection {
  TextThemeCollection();

  static const String _fontFamily = 'Lato';

  String get fontFamily => _fontFamily;

  final Color _defaultColor = AppData.colors.mainTextColor;

  //----------------
  // Size 12
  TextStyle get s12w600 => TextStyle(
        color: _defaultColor,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      );

  TextStyle get s12w500 => TextStyle(
        color: _defaultColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamily,
      );

  //----------------
  // Size 13
  TextStyle get s13w500 => TextStyle(
        color: _defaultColor,
        fontSize: 13,
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamily,
      );
  //----------------
  // Size 14
  TextStyle get s14w400 => TextStyle(
        color: _defaultColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: _fontFamily,
      );

  TextStyle get s14w500Transparent85 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xD9000000),
        fontFamily: _fontFamily,
      );
  TextStyle get s14w500 => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamily,
        color: _defaultColor,
      );

  TextStyle get s14w600 => TextStyle(
        color: _defaultColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );

  TextStyle get s14w700 => TextStyle(
        color: _defaultColor,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      );

  TextStyle get s15w600 => TextStyle(
        color: _defaultColor,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      );

  //----------------
  // Size 16
  TextStyle get s16w400 => TextStyle(
        color: _defaultColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: _fontFamily,
      );
  TextStyle get s16w500 => TextStyle(
        color: _defaultColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamily,
      );

  TextStyle get s16w600 => TextStyle(
        color: _defaultColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        fontFamily: _fontFamily,
      );

  //----------------
  // Size 17
  TextStyle get s17w500 => TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamily,
        color: _defaultColor,
      );
  //----------------
  // Size 18
  TextStyle get s18w600 => TextStyle(
        color: _defaultColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );
  TextStyle get s18w700 => TextStyle(
        color: _defaultColor,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );
  TextStyle get s18w400 => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontFamily: _fontFamily,
        color: _defaultColor,
      );
  TextStyle get s18w500 => TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamily,
        color: _defaultColor,
      );
  //----------------
  // Size 20

  TextStyle get s20w700 => TextStyle(
        color: _defaultColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );

  TextStyle get s20normal => TextStyle(
        fontSize: 20,
        color: _defaultColor,
        fontFamily: _fontFamily,
        fontWeight: FontWeight.normal,
      );
  TextStyle get s20w500 => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamily,
        color: _defaultColor,
      );

  //----------------
  // Size 22

  TextStyle get s22w500 => TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamily,
        color: _defaultColor,
      );
  //----------------
  // Size 28
  TextStyle get s28w700 => TextStyle(
        color: _defaultColor,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      );
  //----------------
  // Size 30
  TextStyle get s30w500 => TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        fontFamily: _fontFamily,
        color: _defaultColor,
      );

  // Size 32
  TextStyle get s32w400 => TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        fontFamily: _fontFamily,
        color: _defaultColor,
      );
  //----------------
  // Error

  TextStyle get error => const TextStyle(
        color: Colors.redAccent,
        fontFamily: _fontFamily,
      );
}
