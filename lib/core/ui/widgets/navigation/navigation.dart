import 'package:academus_2/core/router/routes.dart';
import 'package:academus_2/core/theme/const.dart';
import 'package:academus_2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:academus_2/core/ui/widgets/navigation/navigation_destination.dart';

class Navigation extends ConsumerWidget {
  final String name;

  Navigation({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final settings = ref.watch(serviceLocator.se);
    final routerProvider = ref.watch(serviceLocator.routerProvider);
    final menuProvider = ref.watch(serviceLocator.menuProvider.notifier);
    List<Widget> navigationDestinations = [
      NavigationDestinations(
          onclick: () {
            menuProvider
                .changeIndex(AppLocalizations.of(context).homeScreenMainTitle);
            routerProvider.goNamed(AppRoutes.routeByIndex(0).name);
          },
          text: AppLocalizations.of(context).homeScreenMainTitle,
          icon: "images/menu_icons/main.svg"),
      NavigationDestinations(
          onclick: () {
            menuProvider.changeIndex(
                AppLocalizations.of(context).scheduleScreenMainTitle);
            routerProvider.goNamed(AppRoutes.routeByIndex(1).name);
          },
          text: AppLocalizations.of(context).scheduleScreenMainTitle,
          icon: "images/menu_icons/main.svg"),
      NavigationDestinations(
          onclick: () {
            menuProvider.changeIndex(
                AppLocalizations.of(context).attendanceScreenMainTitle);
            routerProvider.goNamed(AppRoutes.routeByIndex(2).name);
          },
          text: AppLocalizations.of(context).attendanceScreenMainTitle,
          icon: "images/menu_icons/main.svg"),
    ];
    return AnimatedContainer(
      width: 300,
      duration: Duration(milliseconds: 400),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SvgPicture.asset(
          "assets/images/logo.svg",
          width: 100,
          height: 100,
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 440,
          width: 230,
          child: ListView.builder(
            itemCount: navigationDestinations.length,
            itemBuilder: (context, index) => navigationDestinations[index],
          ),
        )
      ]),
    );
  }
}
