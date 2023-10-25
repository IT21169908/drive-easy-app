import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class FireAuthService {
  // For registering a new user
  static Future<User?> registerUsingEmailPassword({
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
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return user;
  }

  // For signing in an user (have already registered)
  static Future<User?> signInUsingEmailPassword({
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
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided.');
        }
      }
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
