import 'package:academus_2/core/domain/providers/app_locator.dart';
import 'package:academus_2/core/domain/providers/service_locator.dart';
import 'package:academus_2/core/l10n/all_locales.dart';
import 'package:academus_2/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ServiceLocator serviceLocator = AppLocator();

void main() {
  serviceLocator.init();
  runApp(const ProviderScope(
    child: App(),
  ));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(serviceLocator.settingsProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: state.theme,
      locale: state.locale,
      supportedLocales: AllLocale.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsProvider = ref.watch(serviceLocator.settingsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('widget.title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).homeScreenMainTitle,
            ),
            Text(
              '_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => {
              ref
                  .read(serviceLocator.settingsProvider.notifier)
                  .changeLocale(settingsProvider.locale),
            },
            tooltip: 'Increment',
            child: const Placeholder(),
          ),
          FloatingActionButton(
            onPressed: () => {
              ref
                  .read(serviceLocator.settingsProvider.notifier)
                  .changeTheme(settingsProvider.theme),
            },
            tooltip: 'Increment',
            child: const Placeholder(),
          ),
        ],
      ),

    );
  }
}
