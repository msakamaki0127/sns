import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sns/constants/routes.dart' as routes;
import 'package:sns/models/main_model.dart';

final loginProvider = ChangeNotifierProvider(((ref) => LoginModel()));

class LoginModel extends ChangeNotifier {
  String email = '';
  String password = '';
  bool isObscure = true;
  Future<void> login({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      routes.toMyAppPage(context: context);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  void toggleIsObscure() {
    isObscure = !isObscure;
  }
}
