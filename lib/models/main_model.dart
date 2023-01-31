import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sns/constants/routes.dart' as routes;
import 'package:sns/constants/strings.dart';
import 'package:sns/domain/firestore_user/firestore_user.dart';

final mainProvider = ChangeNotifierProvider(((ref) => MainModel()));

class MainModel extends ChangeNotifier {
  bool isLoading = false;
  User? currentUser = null;
  late DocumentSnapshot<Map<String, dynamic>> currentUserDoc;
  late FirestoreUser firestoreUser;
  MainModel() {
    init();
  }

  Future<void> init() async {
    startLoading();
    currentUser = FirebaseAuth.instance.currentUser;
    currentUserDoc = await FirebaseFirestore.instance
        .collection(usersFieldKey)
        .doc(currentUser!.uid)
        .get();
    firestoreUser = FirestoreUser.fromJson(currentUserDoc.data()!);
    endLoading();
  }

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  void setCurrentUser() {
    currentUser = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }

  Future<void> logout(
      {required BuildContext context, required MainModel mainModel}) async {
    await FirebaseAuth.instance.signOut();
    setCurrentUser();
    routes.toLoginPage(context: context);
  }
}
