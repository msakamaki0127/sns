import 'package:flutter/material.dart';
import 'package:sns/constants/strings.dart';
import 'package:sns/details/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.controller,
    required this.isObscure,
    required this.toggleIsObscure,
    required this.color,
    required this.borderColor,
    required this.shadowColor,
  }) : super(key: key);
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool isObscure;
  final void Function()? toggleIsObscure;
  final Color color;
  final Color borderColor;
  final Color shadowColor;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: color,
      borderColor: borderColor,
      shadowColor: shadowColor,
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        onChanged: onChanged,
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          suffix: InkWell(
            child:
                isObscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
            onTap: toggleIsObscure,
          ),
          hintText: passwordHint,
          hintStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
