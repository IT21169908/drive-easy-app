import 'package:drive_easy_app/firebase_auth_service.dart';
import 'package:drive_easy_app/utils/check_role_and_redirect.dart';
import 'package:drive_easy_app/utils/theme_consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../enums/user_roles.dart';
import '../../../utils/auth_checker.dart';
import '../../../widgets/widgets.g.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool terms = false;
  bool _obscureText = true;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  UserRoles _selectedUserRole = UserRoles.student; // TODO: implement role select from registration form

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateByAuth(context, mounted, redirectToGuest: false, waitDuration: 0);
    });
    super.initState();
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      CircularLoaderWidget(context);
      try {
        User? user = await FireAuthService.registerUsingEmailPassword(
          name: _fullNameController.text,
          role: _selectedUserRole.name,
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (mounted) {
          CheckRoleAndRedirect(context, user);
        }
      } catch (e) {
        if (kDebugMode) {
          print("_register catch : $e");
        }
      } finally {
        CircularLoaderWidget.dismiss();
      }
    }
  }

  @override
  void dispose() {
    CircularLoaderWidget.dismiss();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                  SvgPicture.asset(
                    "assets/images/clip-arts/laptop-bulb-idea.svg",
                    height: 110,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Register',
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
                    'Create your new account',
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
                          controller: _fullNameController,
                          validator: (fullName) {
                            if ((fullName == null || fullName.isEmpty)) {
                              return "Please enter your Full Name";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Full Name",
                            hintText: "Enter your full name",
                            suffixIcon: SizedBox(),
                          ),
                        ),
                        const SizedBox(height: 10),
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
                        const SizedBox(height: 8),
                        DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButtonFormField<UserRoles?>(
                              isExpanded: true,
                              value: null,
                              dropdownColor: const Color(0xffe1f3fd),
                              items: const [
                                DropdownMenuItem(
                                  value: null,
                                  child: Text(
                                    "Choose Account Type",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: UserRoles.student,
                                  child: Text("Student"),
                                ),
                                DropdownMenuItem(
                                  value: UserRoles.schoolOwner,
                                  child: Text("School Owner"),
                                ),
                                DropdownMenuItem(
                                  value: UserRoles.instructor,
                                  child: Text("Instructor"),
                                ),
                              ],
                              hint: const Text("User Type"),
                              validator: (role) {
                                if ((role == null)) {
                                  return "Please select a user type";
                                }
                                return null;
                              },
                              onChanged: (UserRoles? role) {
                                if ((role != null)) {
                                  _selectedUserRole = role;
                                }
                              },
                            ),
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
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          validator: (confirmPassword) {
                            if ((confirmPassword == null || confirmPassword.isEmpty)) {
                              return "Please enter the confirm password";
                            }
                            if ((confirmPassword != _passwordController.text)) {
                              return "Confirm password does not match the password!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            hintText: "Retype your Password",
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                ),
                                children: const <TextSpan>[
                                  TextSpan(
                                    text: 'By signing up you agree to our ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Terms & Conditions',
                                    style: TextStyle(color: ThemeConsts.appPrimaryYellow),
                                  ),
                                  TextSpan(
                                    text: ' and ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(color: ThemeConsts.appPrimaryYellow),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        MaterialButton(
                          onPressed: _register,
                          minWidth: double.infinity,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: ThemeConsts.appPrimaryBlue,
                          child: const Text(
                            "SING UP",
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
                        'Already have an Account? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.maybePop(context);
                        },
                        child: const Text(
                          'Log In',
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
