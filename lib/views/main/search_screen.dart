import 'package:flutter/material.dart';
import 'package:sns/constants/strings.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(tabBarSearchTitle),
    );
  }
}
