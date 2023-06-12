enum AppRoutes {
  dashboard('dashboard'),
  schedule('schedule'),
  attendance('attendance'),
  groups('groups'),
  students('students'),
  tasks('tasks'),
  homework('homework'),
  accounting('accounting'),
  profile('profile'),
  splash('splash'),
  auth('auth');


  final String routeName;

  const AppRoutes(this.routeName);

  static AppRoutes routeByIndex(selectedIndex) {
    return (AppRoutes.values.elementAt(selectedIndex));
  }

  static int routeByName(routeName) {
    return AppRoutes.values.indexWhere((element) => element.name == routeName);

  }
 }
