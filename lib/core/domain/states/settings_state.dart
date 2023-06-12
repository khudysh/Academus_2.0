import 'package:flutter/material.dart';

class SettingsState {
  ThemeData theme;
  Locale locale;
  bool expandMenu;

  SettingsState(this.theme, this.locale, this.expandMenu);
}