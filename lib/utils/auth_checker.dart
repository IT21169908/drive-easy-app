import 'dart:math';

import 'package:drive_easy_app/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.g.dart';
import 'check_role_and_redirect.dart';

checkAuthAndLogout(widgetContext, widgetMounted, {String? routeName}) async {
  final user = await FirebaseAuth.instance.authStateChanges().take(1).first;
  if (user == null) {
    AppToastWidget("Authentication is Required.");
    if (widgetMounted) {
      Navigator.of(widgetContext).pushNamedAndRemoveUntil(routeName ?? RouteName.guestDashboard, (route) => false);
    }
  } else {}
  return null;
}

navigateByAuth(widgetContext, widgetMounted, {bool redirectToGuest = true, int waitDuration = 5}) async {
  if (kDebugMode) {
    print("checkAuthAndLogout: $waitDuration");
  }
  if (waitDuration > 0) {
    await Future.delayed(Duration(seconds: (Random().nextInt(waitDuration) + 1)));
  }
  final user = await FirebaseAuth.instance.authStateChanges().take(1).first;

  // User? user = FirebaseAuth.instance.currentUser;
  //FirebaseAuth.instance.authStateChanges().listen((User? user) {}).cancel();

  if (kDebugMode) {
    print("FirebaseAuth.instance: $user ");
  }
  if (user != null) {
    CheckRoleAndRedirect(widgetContext, user);
  } else {
    if (widgetMounted && redirectToGuest) {
      Navigator.of(widgetContext).pushNamedAndRemoveUntil(RouteName.guestDashboard, (route) => false);
    }
  }
  return null;
}
