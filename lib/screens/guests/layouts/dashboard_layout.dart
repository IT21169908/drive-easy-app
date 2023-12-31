import 'package:drive_easy_app/screens/guests/auth/login_screen.dart';
import 'package:drive_easy_app/screens/guests/dashboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../widgets/dashboard/scaffold_widget.dart';

class GuestDashboardLayout extends StatefulWidget {
  const GuestDashboardLayout({super.key});

  @override
  State<GuestDashboardLayout> createState() => _GuestDashboardLayoutState();
}

class _GuestDashboardLayoutState extends State<GuestDashboardLayout> {
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
          icon: const Icon(Icons.login),
          title: ("Logout"),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
          onPressed: (BuildContext? context) {
            if (kDebugMode) {
              print("logout");
            }
            // TODO: CHECK context is null first time app launches or some moments
            if (mounted) {
              PersistentNavBarNavigator.pushNewScreen(
                buildContext,
                screen: const LoginScreen(),
                withNavBar: false,
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            }
          },
        ),
      ];

  final List<Widget> _buildScreens = [
    const GuestHomeScreen(),
    Container(),
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
