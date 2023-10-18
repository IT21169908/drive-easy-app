import 'package:drive_easy_app/screens/student/layouts/dashboard_layout.dart';
import 'package:flutter/cupertino.dart';

import '../screens/guests/layouts/dashboard_layout.dart';

class RouteName {
  static const String guestDashboard = '/guest/dashboard';
  static const String studentDashboard = '/student/dashboard';
}

Map<String, Widget Function(BuildContext)> routes = {
  RouteName.guestDashboard: (context) => const GuestDashboardLayout(),
  RouteName.studentDashboard: (context) => const StudentDashboardLayout(),
};
