import 'package:flutter/material.dart';
import 'package:sns/main.dart';
import 'package:sns/models/main_model.dart';
import 'package:sns/views/login_page.dart';
import 'package:sns/views/signup_page.dart';

void toSignupPage({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => SignupPage()));

void toLoginPage({required BuildContext context}) => Navigator.push(
    context, MaterialPageRoute(builder: (context) => LoginPage()));

void toMyAppPage({required BuildContext context}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
