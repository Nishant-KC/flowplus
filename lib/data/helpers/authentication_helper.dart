import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_plus/constants/hive_constants.dart';
import 'package:flow_plus/data/providers/user_or_business_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get user => _auth.currentUser;

  //SIGN UP METHOD
  Future<int?> loginOrRegister({
    String? email,
    String? password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email ?? "",
        password: password ?? "",
      );
      Provider.of<UserOrBusinessProvider?>(context, listen: false)!
          .assignUser(user!.uid);
      Hive.box(HiveConstants.boxName).put(HiveConstants.userId, user!.uid);
      return 1;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        try {
          UserCredential userCreds = await _auth.signInWithEmailAndPassword(
            email: email ?? "",
            password: password ?? "",
          );
          // currentUser = userCreds.user;
          Provider.of<UserOrBusinessProvider?>(context, listen: false)!
              .assignUser(user!.uid);
          Hive.box(HiveConstants.boxName).put(HiveConstants.userId, user!.uid);
          return 2;
        } on FirebaseAuthException catch (e) {
          Get.dialog(
            Dialog(
              child: Text(e.code),
            ),
          );
          return 0;
        }
      } else {
        Get.dialog(
          Dialog(
            child: Text(e.code),
          ),
        );
        return 0;
      }
    }
  }

  //SIGN OUT METHOD
  Future forgotPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
    Get.dialog(
      const Dialog(
        child: Text("Reset Link sent to the Email"),
      ),
    );
  }

  //SIGN OUT METHOD
  Future signOut() async {
    await _auth.signOut();
  }
}
