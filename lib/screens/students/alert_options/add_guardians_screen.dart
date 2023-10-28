import 'package:drive_easy_app/models/models.dart';
import 'package:drive_easy_app/routes/app_routes.dart';
import 'package:drive_easy_app/screens/students/alert_options/your_guardians_screen.dart';
import 'package:drive_easy_app/screens/students/course_enrollment/confirm_payment_screen.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../utils/auth_checker.dart';
import '../../../utils/theme_consts.dart';

class AddGuardiansScreen extends StatefulWidget {
  const AddGuardiansScreen({super.key});

  @override
  State<AddGuardiansScreen> createState() => _AddGuardiansScreenState();
}

class _AddGuardiansScreenState extends State<AddGuardiansScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkAuthAndLogout(context, mounted, routeName: RouteName.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              const TopAppBar(),
              const SizedBox(height: 20),
              const ScreenTopBanner(
                isNormalPage: true,
                bannerMargin: EdgeInsets.zero,
                imageWidth: 100,
                assets: 'assets/images/track-vehicles/add-guardian.png',
                title: Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Text(
                    "Add Guardian",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 8),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Full Name",
                        hintText: "Enter your full name",
                        suffixIcon: SizedBox(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Mobile Number",
                        hintText: "Enter mobile number",
                        suffixIcon: SizedBox(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Address",
                        hintText: "Enter Address",
                        suffixIcon: SizedBox(),
                      ),
                      maxLines: 4,
                      minLines: 3,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "RelationShip",
                        hintText: "Mother/Father/Brother ...",
                        suffixIcon: SizedBox(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff4E74F9),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const YourGuardiansScreen(),
                            withNavBar: true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                        child: const Text(
                          "SAVE",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
