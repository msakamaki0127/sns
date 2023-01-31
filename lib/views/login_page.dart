import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns/constants/strings.dart';
import 'package:sns/details/rounded_button.dart';
import 'package:sns/details/rounded_password_field.dart';
import 'package:sns/details/rounded_text_field.dart';
import 'package:sns/models/login_model.dart';
import 'package:sns/models/main_model.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginModel loginModel = ref.watch(loginProvider);
    final TextEditingController emailEditingController =
        TextEditingController(text: loginModel.email);
    final TextEditingController passwordEditingController =
        TextEditingController(text: loginModel.password);
    return Scaffold(
      appBar: AppBar(
        title: Text(loginTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedTextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (text) => loginModel.email = emailEditingController.text,
            controller: emailEditingController,
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.red,
            hintText: loginEmailAddressHint,
          ),
          RoundedPasswordField(
            onChanged: (text) => loginModel.password = text,
            controller: passwordEditingController,
            isObscure: loginModel.isObscure,
            toggleIsObscure: () => loginModel.toggleIsObscure(),
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.blue,
          ),
          RoundedButton(
              text: loginButtonText,
              onPressed: () => loginModel.login(context: context),
              widthRate: 0.85,
              backgroundColor: Colors.green),
        ],
      ),
    );
  }
}
