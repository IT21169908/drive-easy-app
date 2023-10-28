import 'package:drive_easy_app/models/models.dart';
import 'package:drive_easy_app/routes/app_routes.dart';
import 'package:drive_easy_app/screens/students/course_enrollment/confirm_payment_screen.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../utils/auth_checker.dart';
import '../../../utils/theme_consts.dart';

class YourGuardiansScreen extends StatefulWidget {
  const YourGuardiansScreen({super.key});

  @override
  State<YourGuardiansScreen> createState() => _YourGuardiansScreenState();
}

class _YourGuardiansScreenState extends State<YourGuardiansScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkAuthAndLogout(context, mounted, routeName: RouteName.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              TopAppBar(),
              SizedBox(height: 20),
              ScreenTopBanner(
                isNormalPage: true,
                bannerMargin: EdgeInsets.zero,
                imageWidth: 100,
                assets: 'assets/images/track-vehicles/add-guardian.png',
                title: Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Text(
                    "Your Guardians",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text("Add More Guardians"),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
