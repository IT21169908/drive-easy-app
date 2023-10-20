import 'package:drive_easy_app/widgets/dashboard/scaffold_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../course_enrollment/course_enroll_screen.dart';
import '../home.dart';

class StudentDashboardLayout extends StatefulWidget {
  const StudentDashboardLayout({super.key});

  @override
  State<StudentDashboardLayout> createState() => _StudentDashboardLayoutState();
}

class _StudentDashboardLayoutState extends State<StudentDashboardLayout> {
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
          icon: const Icon(Icons.person_2_outlined),
          title: ("Profile"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
          onPressed: (BuildContext? context) {
            if (kDebugMode) {
              print("Profile screen");
            }
          },
        ),
      ];

  final List<Widget> _buildScreens = [
    const StudentHomeScreen(),
    const CourseEnrollScreen(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      buildScreens: _buildScreens,
      navBarItems: _navBarItems,
    );
  }
}
