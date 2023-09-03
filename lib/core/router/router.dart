import 'package:academus_2/core/router/routes.dart';
import 'package:academus_2/core/ui/widgets/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:academus_2/core/router/screens.dart';

class AppRouter {
  static final router = GoRouter(debugLogDiagnostics: true, routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.splash.name,
      builder: (context, state) => const MyHomePage(),
    ),
    GoRoute(
      path: '/${AppRoutes.auth.name}',
      name: AppRoutes.auth.name,
      builder: (context, state) => const AuthScreen(),
    ),
    ShellRoute(
      builder: (context, GoRouterState state, child) {
        return Row(
          children: <Widget>[
            Navigation(
              name: state.location,
            ),
            Expanded(
              child: Scaffold(
                appBar: AppBar(
                  title: Text(state.location),
                  backgroundColor: Colors.white,
                ),
                body: SafeArea(
                  child: Center(child: child),
                ),
              ),
            ),
          ],
        );
      },
      routes: [
        GoRoute(
            path: '/${AppRoutes.dashboard.name}',
            name: AppRoutes.dashboard.name,
            builder: (context, state) {
              final testId = state.params['testId'] ?? 'Not';
              return const DashboardScreen();
            }),
        GoRoute(
          path: '/${AppRoutes.schedule.name}',
          name: AppRoutes.schedule.name,
          builder: (context, state) => const ScheduleScreen(),
        ),
        GoRoute(
          path: '/${AppRoutes.attendance.name}',
          name: AppRoutes.attendance.name,
          builder: (context, state) => const AttendanceScreen(),
        ),
        GoRoute(
          path: '/${AppRoutes.groups.name}',
          name: AppRoutes.groups.name,
          builder: (context, state) => const GroupsScreen(),
        ),
        GoRoute(
          path: '/${AppRoutes.homework.name}',
          name: AppRoutes.homework.name,
          builder: (context, state) => const HomeworkScreen(),
        ),
        GoRoute(
          path: '/${AppRoutes.tasks.name}',
          name: AppRoutes.tasks.name,
          builder: (context, state) => const TeamScreen(),
        ),
        GoRoute(
          path: '/${AppRoutes.accounting.name}',
          name: AppRoutes.accounting.name,
          builder: (context, state) => const AccountingScreen(),
        ),
        GoRoute(
          path: '/${AppRoutes.students.name}',
          name: AppRoutes.students.name,
          builder: (context, state) => StudentsScreen(),
        ),
        GoRoute(
          path: '/${AppRoutes.profile.name}',
          name: AppRoutes.profile.name,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    )
  ]);
}
