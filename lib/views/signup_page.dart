import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns/constants/strings.dart';
import 'package:sns/details/rounded_button.dart';
import 'package:sns/details/rounded_password_field.dart';
import 'package:sns/details/rounded_text_field.dart';
import 'package:sns/models/signup_model.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SignupModel signupModel = ref.watch(signupProvider);
    final TextEditingController emailEditingController =
        TextEditingController(text: signupModel.email);
    final TextEditingController passwordEditingController =
        TextEditingController(text: signupModel.password);
    return Scaffold(
      appBar: AppBar(
        title: Text(signupTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RoundedTextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) =>
                signupModel.email = emailEditingController.text,
            controller: emailEditingController,
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.orange,
            hintText: signupEmailAddressHint,
          ),
          RoundedPasswordField(
            onChanged: (text) => signupModel.password = text,
            controller: passwordEditingController,
            isObscure: signupModel.isObscure,
            toggleIsObscure: () => signupModel.toggleIsObscure(),
            color: Colors.white,
            borderColor: Colors.black,
            shadowColor: Colors.orange,
          ),
          RoundedButton(
            text: signupButtonText,
            onPressed: () => signupModel.createUser(context: context),
            widthRate: 0.85,
            backgroundColor: Colors.red,
          )
        ],
      ),
    );
  }
}
