import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:academus_2/core/domain/states/settings_state.dart';
import 'package:academus_2/core/domain/states/settings_notifier.dart';
import 'package:go_router/go_router.dart';

abstract class ServiceLocator {
  // abstract final StateNotifierProvider<AuthenticationStateNotifier, AuthenticationState> authenticationStateNotifier;

  abstract final StateNotifierProvider<SettingsStateNotifier, SettingsState>
      settingsProvider;
  abstract final Provider<GoRouter> routerProvider;

  // abstract final StateNotifierProvider<TestAttemptStateNotifier, TestPassingState?> testAttemptStateNotifier;
  // abstract final StateNotifierProvider<TestCreationStateNotifier, TestWithQuestion> testCreationStateNotifier;
  // abstract final StateNotifierProvider<TestListStateNotifier, TestListState> testListStateNotifier;
  // abstract final StateNotifierProvider<TestResultStateNotifier, TestResultState> testResultsStateNotifier;

  Future<void> init();
}
