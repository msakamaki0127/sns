import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns/constants/strings.dart';
import 'package:sns/details/rounded_button.dart';
import 'package:sns/details/user_image.dart';
import 'package:sns/main.dart';
import 'package:sns/models/main/profile_model.dart';
import 'package:sns/models/main_model.dart';

class ProfileScreen extends ConsumerWidget {
  ProfileScreen({Key? key, required this.mainModel}) : super(key: key);

  final MainModel mainModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProfileModel profileModel = ref.watch(profileProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        profileModel.xFile == null
            ? Container(
                alignment: Alignment.center,
                child: UserImage(
                  length: 100.0,
                  userImageURL: mainModel.firestoreUser.userImageURL,
                ),
              )
            : Text('Loading...'),
        RoundedButton(
            text: 'Upload',
            onPressed: () async => await profileModel.uploadUserImage(
                currentUserDoc: mainModel.currentUserDoc),
            widthRate: 0.5,
            backgroundColor: Colors.green)
      ],
    );

    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Container(
    //       child: Text(
    //         mainModel.firestoreUser.userName,
    //         style: TextStyle(fontSize: 50),
    //       ),
    //     ),
    //   ],
    // );
  }
}
