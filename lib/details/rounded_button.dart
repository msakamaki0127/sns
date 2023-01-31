import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.widthRate,
      required this.backgroundColor})
      : super(key: key);
  final String text;
  final void Function()? onPressed;
  // 0 < widthRate <= 1.0
  final double widthRate;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Container(
      width: maxWidth * widthRate,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Text(text),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        ),
      ),
    );
  }
}
