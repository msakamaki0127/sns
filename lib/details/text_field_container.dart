import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer(
      {Key? key,
      required this.color,
      required this.borderColor,
      required this.shadowColor,
      required this.child})
      : super(key: key);
  final Color color;
  final Color borderColor;
  final Color shadowColor;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        width: width * 0.9,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 8.0,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: child,
      ),
    );
  }
}
