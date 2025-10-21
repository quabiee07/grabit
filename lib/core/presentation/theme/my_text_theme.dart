import 'package:flutter/material.dart';

import 'colors/colors.dart';

class MyTextTheme {
  static const _color1d = Color(0xff23334A);
  static const lightTextTheme = TextTheme(
      displayLarge: TextStyle(
          color: textColorLight,
          fontFamily: 'Fredoka',
          fontWeight: FontWeight.w700),
      displayMedium: TextStyle(
          color: textColorLight,
          fontFamily: 'Fredoka',
          fontSize: 16,
          fontWeight: FontWeight.w500),
      displaySmall: TextStyle(
        color: textColorLight,
        fontFamily: 'Fredoka',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: textColorLight,
        fontFamily: 'Fredoka',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
          color: textColorLight,
          fontFamily: 'Fredoka',
          fontSize: 14,
          fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(
          color: textColorLight,
          fontFamily: 'Fredoka',
          fontSize: 14,
          fontWeight: FontWeight.w700),
      titleLarge: TextStyle(
          color: _color1d,
          fontFamily: 'Fredoka',
          fontSize: 24,
          fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: _color1d,
          fontFamily: 'Fredoka',
          fontSize: 16,
          fontWeight: FontWeight.w700),
      titleSmall: TextStyle(
          color: _color1d,
          fontFamily: 'Fredoka',
          fontSize: 14,
          fontWeight: FontWeight.w400),
      labelLarge: TextStyle(
          color: _color1d,
          fontFamily: 'Fredoka',
          fontSize: 16,
          fontWeight: FontWeight.w700),
      labelMedium: TextStyle(
        color: textColorLight,
        fontFamily: 'Fredoka',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: TextStyle(
          color: textColorLight,
          fontFamily: 'Fredoka',
          fontSize: 14,
          fontWeight: FontWeight.w400));

  static const darkTextTheme = TextTheme(
      displayLarge: TextStyle(
          color: textColorDark,
          fontFamily: 'Fredoka',
          fontWeight: FontWeight.w700),
      displayMedium: TextStyle(
          color: textColorDark,
          fontFamily: 'Fredoka',
          fontSize: 16,
          fontWeight: FontWeight.w500),
      displaySmall: TextStyle(
          color: textColorDark,
          fontFamily: 'Fredoka',
          fontSize: 14,
          fontWeight: FontWeight.normal),
      bodySmall: TextStyle(
        color: textColorDark,
        fontFamily: 'Fredoka',
        fontSize: 14,
      ),
      bodyMedium: TextStyle(
          color: textColorDark,
          fontFamily: 'Fredoka',
          fontSize: 14,
          fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(
          color: textColorDark,
          fontFamily: 'Fredoka',
          fontSize: 14,
          fontWeight: FontWeight.w700),
      titleLarge: TextStyle(
          color: textColorDark,
          fontFamily: 'Fredoka',
          fontSize: 24,
          fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: textColorDark,
          fontFamily: 'Fredoka',
          fontSize: 18,
          fontWeight: FontWeight.w500),
      titleSmall: TextStyle(
          color: textColorDark,
          fontFamily: 'Fredoka',
          fontSize: 14,
          fontWeight: FontWeight.w300),
      labelLarge: TextStyle(
          color: textColorDark,
          fontFamily: 'Fredoka',
          fontSize: 16,
          fontWeight: FontWeight.w700),
      labelMedium: TextStyle(
          color: textColorDark,
          fontFamily: 'Fredoka',
          fontSize: 16,
          fontWeight: FontWeight.w500));
}
