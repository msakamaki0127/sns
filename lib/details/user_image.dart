import 'package:flutter/material.dart';
import 'package:sns/details/circle_image.dart';

class UserImage extends StatelessWidget {
  UserImage({Key? key, required this.length, required this.userImageURL})
      : super(key: key);
  final double length;
  final String userImageURL;
  @override
  Widget build(BuildContext context) {
    return userImageURL.isEmpty || userImageURL == ""
        ? Container(
            width: length,
            height: length,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green),
            ),
            child: Icon(
              Icons.person,
              size: length,
            ),
          )
        : CircleImage(
            length: length,
            image: NetworkImage(userImageURL),
          );
  }
}
