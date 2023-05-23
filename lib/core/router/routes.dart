enum AppRoutes {
  splash('splash'),
  auth('auth'),
  dashboard('dashboard'),
  schedule('schedule'),
  attendance('attendance'),
  groups('groups'),
  homework('homework'),
  students('students'),
  team('team'),
  accounting('accounting'),
  profile('profile');

  final String routeName;

  const AppRoutes(this.routeName);
}
