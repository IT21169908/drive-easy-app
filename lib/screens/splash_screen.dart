import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
 
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
                    'assets/images/logo-bg-icon.svg', // Replace with the actual path of your logo
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: SvgPicture.asset(
                      'assets/images/logo.svg', // Replace with the actual path of your logo
                      height: 50.0,
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
              'assets/images/splash-screen-parking.png', // Replace with the actual path of your bottom image
              height: 375.0, // Adjust the size as needed
            ),
          ),
        ],
      ),
    );
  }
}
