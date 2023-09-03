import 'package:academus_2/core/router/screens.dart';
import 'package:academus_2/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationDestinations extends ConsumerStatefulWidget {
  VoidCallback onclick;
  String text;
  String icon;
  NavigationDestinations(
      {super.key,
      required this.onclick,
      required this.text,
      required this.icon});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NavigationDestinationsState();
}

class _NavigationDestinationsState
    extends ConsumerState<NavigationDestinations> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(serviceLocator.settingsProvider);
    final color = ref.watch(serviceLocator.menuProvider).indexMenu;

    return GestureDetector(
        onTap: widget.onclick,
        child: Container(
          decoration: BoxDecoration(
              color: color == widget.text
                  ? Theme.of(context).colorScheme.primary
                  : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 0, 16),
            child: Row(
              children: [
                SvgPicture.asset(
                  widget.icon,
                  color: color == widget.text ? Colors.white : Colors.black,
                  width: 20,
                  height: 20,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  settings.expandMenu ? widget.text : "",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ));
  }
}
