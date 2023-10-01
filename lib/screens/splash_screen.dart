import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final double _defaultLogoHeight = 50;
  final double _expandedImageHeight = 300;

  final String defaultLogo = "assets/images/logo.svg";
  final String animatedLogo = "assets/images/logo-bg-icon.svg";

  double _initialImageHeight = 50;
  String _displayLogo = "assets/images/logo.svg";

  @override
  void initState() {
    super.initState();
    _authenticateUser();
  }

  void _authenticateUser() {
    // TODO: check logged user
    Future.delayed(const Duration(seconds: 5)).then((res) async {
      if (mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(RouteName.guestDashboard, (route) => false);
      }
    });
  }

  Future<void> _refreshScreen() async {
    if (mounted) {
      setState(() {
        _displayLogo = animatedLogo;
        _initialImageHeight = _expandedImageHeight;
      });
    }
    await Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _displayLogo = defaultLogo;
          _initialImageHeight = _defaultLogoHeight;
        });
      }
    });
    await Future.delayed(const Duration(seconds: 3), () => _authenticateUser());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.8,
                  child: SvgPicture.asset(
                    'assets/images/logo-bg-icon.svg',
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onDoubleTap: _refreshScreen,
                    child: AnimatedContainer(
                      height: _initialImageHeight,
                      curve: Curves.easeInOutExpo,
                      duration: const Duration(milliseconds: 200),
                      child: SvgPicture.asset(
                        _displayLogo,
                        height: _initialImageHeight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -8,
            left: -20,
            child: Image.asset(
              'assets/images/splash-screen-parking.png',
              height: 375.0,
            ),
          ),
        ],
      ),
    );
  }
}
