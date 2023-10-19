import 'package:drive_easy_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../widgets.g.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({super.key, required this.navBarItems, required this.buildScreens});

  final List<PersistentBottomNavBarItem> Function(BuildContext buildContext) navBarItems;

  final List<Widget> buildScreens;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PersistentBottomNavBarWidget(
          context,
          controller: persistentTabController,
          screens: buildScreens,
          items: navBarItems(context),
        ),
      ),
    );
  }
}
