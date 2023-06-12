import 'package:academus_2/core/router/routes.dart';
import 'package:academus_2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TeamScreen extends ConsumerWidget {
  const TeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsNotifier =
        ref.watch(serviceLocator.settingsProvider.notifier);
    final routerProvider = ref.watch(serviceLocator.routerProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
            onPressed: () =>
                {routerProvider.goNamed(AppRoutes.splash.name)},
            child: Text("ggg")),
        Text(
          AppLocalizations.of(context).homeScreenMainTitle,
        ),
      ],
    );
  }
}
