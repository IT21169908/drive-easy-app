import 'package:drive_easy_app/screens/splash_screen.dart';
import 'package:drive_easy_app/utils/theme_consts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drive Easy',
      theme: ThemeConsts.lightTheme,
      darkTheme: ThemeConsts.darkTheme,
      home: const SplashScreen(),
    );
  }
}
