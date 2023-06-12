import 'package:academus_2/core/theme/widgets_theme/app_bar.dart';
import 'package:academus_2/core/theme/widgets_theme/elevated_buttons.dart';
import 'package:academus_2/core/theme/widgets_theme/text_field.dart';
import 'package:flutter/material.dart';

import 'package:academus_2/core/theme/const.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    hintColor: Const.inactiveColor,
    colorScheme: const ColorScheme(
      background: Const.backgroundColor,
      onBackground: Const.tertiaryColor,
      error: Const.formErrorColor,
      onError: Const.backgroundColor,
      primary: Const.primaryColor,
      onPrimary: Const.tertiaryColor,
      secondary: Const.secondaryColor,
      onSecondary: Const.backgroundColor,
      surface: Const.backgroundColor,
      onSurface: Const.tertiaryColor,
      tertiary: Const.tertiaryColor,
      onTertiary: Const.backgroundColor,
      brightness: Brightness.light,
    ),
      appBarTheme: AppBarThemes.light,
      inputDecorationTheme: TextFieldThemes.light,

      elevatedButtonTheme: ElevatedButtonThemes.light
  );

  static final darkTheme = ThemeData(
    hintColor: Const.darkInactiveColor,
    colorScheme: const ColorScheme(
      background: Const.darkBackgroundColor,
      onBackground: Const.darkTertiaryColor,
      error: Const.darkFormErrorColor,
      onError: Const.darkBackgroundColor,
      primary: Const.darkPrimaryColor,
      onPrimary: Const.darkTertiaryColor,
      secondary: Const.darkSecondaryColor,
      onSecondary: Const.darkBackgroundColor,
      surface: Const.darkBackgroundColor,
      onSurface: Const.darkTertiaryColor,
      tertiary: Const.darkTertiaryColor,
      onTertiary: Const.darkBackgroundColor,
      brightness: Brightness.dark,
    ),
      inputDecorationTheme: TextFieldThemes.dark,
      appBarTheme: AppBarThemes.dark,
      elevatedButtonTheme: ElevatedButtonThemes.dark
  );
}