import 'package:drive_easy_app/screens/guests/auth/register_screen.dart';
import 'package:drive_easy_app/services/firebase_auth_service.dart';
import 'package:drive_easy_app/utils/auth_checker.dart';
import 'package:drive_easy_app/widgets/widgets.g.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../utils/check_role_and_redirect.dart';
import '../../../utils/theme_consts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateByAuth(context, mounted, redirectToGuest: false, waitDuration: 0);
    });
    super.initState();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      CircularLoaderWidget(context);
      try {
        User? user = await FireAuthService.signInUsingEmailPassword(
          context: context,
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (mounted) {
          CheckRoleAndRedirect(context, user);
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      } finally {
        CircularLoaderWidget.dismiss();
      }
    }
  }

  @override
  void dispose() {
    CircularLoaderWidget.dismiss();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  const TopAppBar(),
                  SvgPicture.asset("assets/images/clip-arts/idea-bulb.svg"),
                  const SizedBox(height: 20),
                  Text(
                    'Welcome back',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                      color: const Color(0xff000000),
                      fontSize: 26,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                  Text(
                    'Log into your account',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                      color: const Color(0x80000000),
                      fontSize: 16,
                      letterSpacing: 0,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          validator: (email) {
                            if ((email == null || email.isEmpty)) {
                              return "Please enter your email";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Email",
                            hintText: "Enter your email or phone",
                            suffixIcon: SizedBox(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          validator: (password) {
                            if ((password == null || password.isEmpty)) {
                              return "Please enter your password";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter your Password",
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.visibility_off_rounded,
                                  size: 26,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password?",
                              style: GoogleFonts.poppins(
                                color: ThemeConsts.appPrimaryYellow,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        MaterialButton(
                          onPressed: _login,
                          minWidth: double.infinity,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: ThemeConsts.appPrimaryBlue,
                          child: const Text(
                            "SING IN",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SvgPicture.asset(
                    'assets/images/social_login_divider_or.svg',
                    semanticsLabel: "Divider",
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0), // Adjust border radius as needed
                        ),
                        minWidth: 50,
                        child: SvgPicture.asset(
                          'assets/images/google_icon.svg',
                          width: 37,
                          semanticsLabel: "Google Login",
                        ),
                      ),
                      const SizedBox(width: 15),
                      MaterialButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0), // Adjust border radius as needed
                        ),
                        minWidth: 50,
                        child: SvgPicture.asset(
                          'assets/images/fb_icon.svg',
                          semanticsLabel: "Facebook Login",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ////Dont Hve
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don’t Have an Account?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const RegisterScreen(),
                            withNavBar: false,
                            pageTransitionAnimation: PageTransitionAnimation.cupertino,
                          );
                        },
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            color: ThemeConsts.appPrimaryYellow,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
