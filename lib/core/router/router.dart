import 'package:academus_2/core/router/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:academus_2/core/router/screens.dart';

class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
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
      GoRoute(
        path: '/${AppRoutes.dashboard.name}',
        name: AppRoutes.dashboard.name,
        builder: (context, state) => const DashboardScreen(),
      ),
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
        path: '/${AppRoutes.team.name}',
        name: AppRoutes.team.name,
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
        builder: (context, state) => const StudentsScreen(),
      ),
      GoRoute(
        path: '/${AppRoutes.profile.name}',
        name: AppRoutes.profile.name,
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
}
