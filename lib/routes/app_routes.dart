import 'package:flutter/cupertino.dart';

import '../screens/guests/layouts/dashboard_layout.dart';

class RouteName {
  static const String guestDashboard = '/guest/dashboard';
}

Map<String, Widget Function(BuildContext)> routes = {
  RouteName.guestDashboard: (context) => const GuestDashboardLayout(),
};
