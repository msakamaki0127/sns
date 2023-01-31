import 'package:flutter/material.dart';
import 'package:sns/constants/bottom_navigation_bar_elements.dart';
import 'package:sns/models/bottom_navigation_bar_model.dart';

class SNSBottomNavigationBar extends StatelessWidget {
  SNSBottomNavigationBar({Key? key, required this.model}) : super(key: key);
  final BottomNavigationBarModel model;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: bottomNavigationBarElements,
      currentIndex: model.currentIndex,
      onTap: (index) => model.onTabTapped(index: index),
    );
  }
}
