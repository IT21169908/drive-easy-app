import 'package:drive_easy_app/enums/user_roles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../screens/errors/records_not_found.dart';

class CheckRoleAndRedirect {
  final BuildContext widgetContext;
  final User? user;

  CheckRoleAndRedirect(this.widgetContext, this.user) {
    if (user != null) {
      _checkAndRedirect();
    }
  }

  Future<void> _checkAndRedirect() async {
    final loggedUser = await getUserFromDb();
    String userRole = loggedUser?['role'] ?? '';

    if (kDebugMode) {
      print("CheckRoleAndRedirect _checkAndRedirect: $userRole");
    }
    if (userRole == UserRoles.student.name) {
      await _redirectToStudentDashboard();
    } else if (userRole == UserRoles.schoolOwner.name) {
      await _redirectToSchoolOwnerDashboard();
    } else {
      await _redirectTNotFound();
    }
    return;
  }

  Future<Map<dynamic, dynamic>?> getUserFromDb() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('users/${user!.uid}').get();
    if (snapshot.exists) {
      // print("snapshot.value: ${snapshot.value}");
      final data = snapshot.value as Map<dynamic, dynamic>?;
      if (kDebugMode) {
        print("FirebaseDatabase: ${data?['role']}");
      }
      return data;
    } else {
      if (kDebugMode) {
        print('No data available.');
      }
    }
    return null;
  }

  Future<void> _redirectToSchoolOwnerDashboard() async {
    await Navigator.of(widgetContext).pushNamedAndRemoveUntil(RouteName.studentDashboard, (route) => false);
  }

  Future<void> _redirectToStudentDashboard() async {
    await Navigator.of(widgetContext).pushNamedAndRemoveUntil(RouteName.studentDashboard, (route) => false);
  }

  Future<void> _redirectTNotFound() async {
    await Navigator.of(widgetContext).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const RecordsNotFound(
          title: "Role is not valid",
          subtitle: 'Contact Administrator.',
        ),
      ),
    );
  }
}
