import 'package:academus_2/core/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:academus_2/core/domain/states/settings_state.dart';
import 'package:academus_2/core/domain/states/settings_notifier.dart';
import 'package:academus_2/core/domain/providers/service_locator.dart';
import 'package:academus_2/core/theme/theme.dart';
import 'package:go_router/go_router.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class AppLocator implements ServiceLocator {
  @override
  late final StateNotifierProvider<SettingsStateNotifier, SettingsState>
      settingsProvider;

  @override
  late final Provider<GoRouter> routerProvider;

  @override
  Future<void> init() async {
    _initSettings();
    _initRouter();
  }

  void _initSettings() {
    settingsProvider =
        StateNotifierProvider<SettingsStateNotifier, SettingsState>((ref) {
      return SettingsStateNotifier(SettingsState(
          AppThemes.darkTheme, AppLocalizations.supportedLocales[0]));
    });
  }

  void _initRouter() {
    routerProvider = Provider<GoRouter>((ref) {
      return AppRouter.router;
    });
  }

  Future<void> _initAuth() async {
    await Firebase.initializeApp();
    final authProvider = StreamProvider<User?>((ref) {
      return FirebaseAuth.instance.authStateChanges();
    });
  }
}
