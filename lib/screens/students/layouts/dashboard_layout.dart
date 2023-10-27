import 'package:drive_easy_app/utils/auth_checker.dart';
import 'package:drive_easy_app/widgets/dashboard/scaffold_widget.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../dashboard.dart';

class StudentDashboardLayout extends StatefulWidget {
  const StudentDashboardLayout({super.key});

  @override
  State<StudentDashboardLayout> createState() => _StudentDashboardLayoutState();
}

class _StudentDashboardLayoutState extends State<StudentDashboardLayout> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkAuthAndLogout(context, mounted);
    });
    super.initState();
  }

  List<PersistentBottomNavBarItem> _navBarItems(BuildContext buildContext) => [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: "Home",
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.support_agent),
          title: ("Chat"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.notifications),
          title: ("Notify"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
          onPressed: (context) {
            if (kDebugMode) {
              print("Notification screen");
            }
          },
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.logout),
          title: ("Logout"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
          onPressed: (BuildContext? context) async {
            if (kDebugMode) {
              print("Logout screen");
            }
            showSignOutDialog(buildContext, mounted);
          },
        ),
      ];

  final List<Widget> _buildScreens = [
    const StudentHomeScreen(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      buildScreens: _buildScreens,
      navBarItems: _navBarItems,
    );
  }
}
