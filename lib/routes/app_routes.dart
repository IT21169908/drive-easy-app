import 'package:drive_easy_app/screens/guests/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../screens/guests/layouts/dashboard_layout.dart';
import '../screens/students/layouts/dashboard_layout.dart';

class RouteName {
  static const String login = '/login';
  static const String guestDashboard = '/guest/dashboard';
  static const String studentDashboard = '/student/dashboard';
}

Map<String, Widget Function(BuildContext)> routes = {
  RouteName.login: (context) => const LoginScreen(),
  RouteName.guestDashboard: (context) => const GuestDashboardLayout(),
  RouteName.studentDashboard: (context) => const StudentDashboardLayout(),
};

final PersistentTabController persistentTabController = PersistentTabController(initialIndex: 0);
