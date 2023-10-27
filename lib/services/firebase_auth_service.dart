import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.g.dart';

class FireAuthService {
  // For registering a new user
  static Future<User?> registerUsingEmailPassword({
    required context,
    required String email,
    required String name,
    required String role,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = credential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;

      DatabaseReference usersRef = FirebaseDatabase.instance.ref("users/${credential.user?.uid}");

      // TODO: save role
      await usersRef.set({
        "email": credential.user?.email,
        "first_name": name.split(" ")[0],
        "last_name": name.split(" ")[1],
        "role": role,
        "photoURL": credential.user?.photoURL,
        "phoneNumber": credential.user?.phoneNumber,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AppSnackBarWidget(
          context: context,
          bgColor: Colors.red,
        ).show(message: "The password provided is too weak.");
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        AppSnackBarWidget(
          context: context,
          bgColor: Colors.red,
        ).show(message: "The account already exists for that email.");
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
      if (kDebugMode) {
        print(e.message);
      } else {
        AppSnackBarWidget(
          context: context,
          bgColor: Colors.red,
        ).show(message: e.message ?? 'Something went wrong!');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      AppSnackBarWidget(
        context: context,
        bgColor: Colors.red,
      ).show(message: e.toString());
    }

    return user;
  }

  // For signing in an user (have already registered)
  static Future<User?> signInUsingEmailPassword({
    required context,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppSnackBarWidget(
          context: context,
          bgColor: Colors.red,
        ).show(message: "No user found for that email.");
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        AppSnackBarWidget(
          context: context,
          bgColor: Colors.red,
        ).show(message: "Wrong password provided.");
        if (kDebugMode) {
          print('Wrong password provided.');
        }
      } else {
        AppSnackBarWidget(
          context: context,
          bgColor: Colors.red,
        ).show(message: 'Something went wrong!');
      }
      if (kDebugMode) {
        print("FirebaseAuthException: ${e.message} | ${e.code}");
      }
    } catch (e) {
      if (kDebugMode) {
        print("signInWithEmailAndPassword: $e");
      }
      AppSnackBarWidget(
        context: context,
        bgColor: Colors.red,
      ).show(message: e.toString());
    }

    return user;
  }

  static Future<User?> refreshUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.currentUser?.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }
}
