import 'package:flutter/material.dart';
import 'package:sns/constants/strings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(tabBarHomeTitle),
    );
  }
}
