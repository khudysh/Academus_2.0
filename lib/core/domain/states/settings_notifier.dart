import 'package:academus_2/core/domain/states/settings_state.dart';
import 'package:academus_2/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsStateNotifier extends StateNotifier<SettingsState> {
  SettingsStateNotifier(super.state);

  void changeLocale(Locale locale) {
    state = SettingsState(
        state.theme,
        locale == AppLocalizations.supportedLocales[0]
            ? AppLocalizations.supportedLocales[1]
            : AppLocalizations.supportedLocales[0]);
  }

  void changeTheme(ThemeData theme) {
    state = SettingsState(
        theme == AppThemes.darkTheme
            ? AppThemes.lightTheme
            : AppThemes.darkTheme,
        state.locale);
  }
}
