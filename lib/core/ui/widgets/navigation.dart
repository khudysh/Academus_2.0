import 'package:academus_2/core/router/routes.dart';
import 'package:academus_2/core/theme/const.dart';
import 'package:academus_2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Navigation extends ConsumerWidget {
  final String name;

  Navigation({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routerProvider = ref.watch(serviceLocator.routerProvider);
    final settingsNotifier =
        ref.watch(serviceLocator.settingsProvider.notifier);
    final expandMenu = ref.watch(serviceLocator.settingsProvider).expandMenu;
    final newName = name.split('/').last;

    return NavigationRail(
      extended: expandMenu,
      leading: expandMenu ? SvgPicture.asset("assets/images/logo.svg", fit: BoxFit.contain,
        height: 80.0,
        width: 80.0,) : SvgPicture.asset("assets/images/logo_collapsed.svg", fit: BoxFit.contain,
      height: 80.0,
        width: 80.0,),
      destinations:  [
        NavigationRailDestination(

          icon: Icon(
            Icons.space_dashboard_outlined,
          ),
          selectedIcon: Icon(
            Icons.space_dashboard,
          ),
          label: Text(
              AppLocalizations.of(context).homeScreenMainTitle,
          ),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.schedule_outlined,
          ),
          selectedIcon: Icon(
            Icons.schedule,
          ),
          label: Text(
            AppLocalizations.of(context).scheduleScreenMainTitle,
          ),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.app_registration_outlined,
          ),
          selectedIcon: Icon(
            Icons.app_registration,
          ),
          label: Text(
              AppLocalizations.of(context).attendanceScreenMainTitle,
          ),
        ),
        NavigationRailDestination(
          icon: Icon(
            Icons.groups_outlined,
          ),
          selectedIcon: Icon(
            Icons.groups,
          ),
          label: Text(
            AppLocalizations.of(context).groupsScreenMainTitle,
          ),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person_search_outlined),
          selectedIcon: Icon(
            Icons.person_search,
          ),
          label: Text(
            AppLocalizations.of(context).studentsScreenMainTitle,
          ),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.task_alt_outlined),
          selectedIcon: Icon(
            Icons.task_alt,
          ),
          label: Text(
            AppLocalizations.of(context).tasksScreenMainTitle,
          ),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.menu_book_outlined),
          selectedIcon: Icon(
            Icons.menu_book,
          ),
          label: Text(
            AppLocalizations.of(context).homeworksScreenMainTitle,
          ),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.account_balance_wallet_outlined),
          selectedIcon: Icon(
            Icons.account_balance_wallet,
          ),
          label: Text(
            AppLocalizations.of(context).reportsScreenMainTitle,
          ),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.account_circle_outlined),
          selectedIcon: Icon(
            Icons.account_circle,
          ),
          label: Text(
            AppLocalizations.of(context).profileScreenMainTitle,
          ),
        ),
      ],
      selectedIndex: AppRoutes.routeByName(newName),
      onDestinationSelected: (selectedIndex) {

        routerProvider.goNamed(AppRoutes.routeByIndex(selectedIndex).name);
      },
      trailing: Expanded(
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: Const.paddingBetweenLarge),
            child: ElevatedButton(
              child: expandMenu ? const Padding(
                padding: EdgeInsets.symmetric(vertical: Const.paddingBetweenSmall, horizontal: Const.paddingBetweenLarge + 40),
                child: Icon(Icons.arrow_back_outlined,color: Colors.white),
              ) : const Padding(
                padding: EdgeInsets.all(Const.paddingBetweenSmall),
                child: Icon(Icons.arrow_forward_rounded,color: Colors.white),
              ),
                onPressed: () {
                  settingsNotifier.changeExpandMenu();
                }),
          ),
        ]),
      ),
    );
  }
}
