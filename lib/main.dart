import 'package:academus_2/core/domain/providers/app_locator.dart';
import 'package:academus_2/core/domain/providers/service_locator.dart';
import 'package:academus_2/core/l10n/all_locales.dart';
import 'package:academus_2/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ServiceLocator serviceLocator = AppLocator();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator.init();
  runApp(const ProviderScope(
    child: App(),
  ));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(serviceLocator.settingsProvider);
    final router = ref.watch(serviceLocator.routerProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: settings.theme,
      locale: settings.locale,
      supportedLocales: AllLocale.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerConfig: router,
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsProvider = ref.watch(serviceLocator.settingsProvider);
    final routerProvider = ref.watch(serviceLocator.routerProvider);
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
            onPressed: () => {routerProvider.goNamed(AppRoutes.team.name)},
            tooltip: 'Increment',
            child: const Placeholder(),
          ),
        ],
      ),
    );
  }
}
