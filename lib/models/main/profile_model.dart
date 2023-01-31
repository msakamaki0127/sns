import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sns/constants/others.dart';
import 'package:sns/constants/strings.dart';

final profileProvider = ChangeNotifierProvider((ref) => ProfileModel());

class ProfileModel extends ChangeNotifier {
  XFile? xFile;

  Future<void> pickImage() async {
    xFile = await returnXPath();
  }

  Future<String> uploadImageAndGetURL(
      {required String uid, required File file}) async {
    final String filename = returnJpegFileName();
    final Reference storageRef = FirebaseStorage.instance
        .ref()
        .child('users')
        .child(uid)
        .child(filename);
    await storageRef.putFile(file);
    return await storageRef.getDownloadURL();
  }

  Future<void> uploadUserImage(
      {required DocumentSnapshot<Map<String, dynamic>> currentUserDoc}) async {
    xFile = await returnXPath();
    final File file = File(xFile!.path);
    final String uid = currentUserDoc.id;
    final String url = await uploadImageAndGetURL(uid: uid, file: file);
    await currentUserDoc.reference.update({'userImageURL': url});
    notifyListeners();
  }
}
