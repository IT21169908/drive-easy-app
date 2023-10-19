part of '../widgets.g.dart';

class PersistentBottomNavBarWidget extends StatelessWidget {
  const PersistentBottomNavBarWidget(
    this.context, {
    super.key,
    required this.screens,
    this.controller,
    this.items,
    this.popAllScreensOnTapOfSelectedTab = true,
    this.popActionScreens = PopActionScreensType.all,
  });

  final BuildContext context;
  final PersistentTabController? controller;
  final List<Widget> screens;
  final List<PersistentBottomNavBarItem>? items;
  final bool popAllScreensOnTapOfSelectedTab;
  final PopActionScreensType popActionScreens;

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: screens,
      items: items,
      decoration: const NavBarDecoration(
          colorBehindNavBar: Colors.indigo,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x15000000),
              offset: Offset(0, -2),
              blurRadius: 8,
            ),
          ]),
      backgroundColor: Colors.white,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
      ),
      popAllScreensOnTapOfSelectedTab: popAllScreensOnTapOfSelectedTab,
      popActionScreens: popActionScreens,
      navBarStyle: NavBarStyle.style1,
    );
  }
}
