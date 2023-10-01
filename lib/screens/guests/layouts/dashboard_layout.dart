import 'package:drive_easy_app/screens/guests/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../widgets/widgets.g.dart';

class GuestDashboardLayout extends StatefulWidget {
  const GuestDashboardLayout({super.key});

  @override
  State<GuestDashboardLayout> createState() => _GuestDashboardLayoutState();
}

class _GuestDashboardLayoutState extends State<GuestDashboardLayout> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
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
        onPressed: (context) {
          if (kDebugMode) {
            print("logout");
          }
        },
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      const GuestHomeScreen(),
      Container(),
      Container(),
      Container(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentBottomNavBarWidget(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarItems(),
      ),
    );
  }
}
