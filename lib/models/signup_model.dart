import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sns/constants/strings.dart';
import 'package:sns/domain/firestore_user/firestore_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

final signupProvider = ChangeNotifierProvider(((ref) => SignupModel()));

class SignupModel extends ChangeNotifier {
  int counter = 0;
  // auth
  String email = "";
  String password = "";
  bool isObscure = true;
  Future<void> createFirestoreUser(
      {required BuildContext context, required String uid}) async {
    counter++;
    final Timestamp now = Timestamp.now();
    final FirestoreUser firestoreUser = FirestoreUser(
        createdAt: now,
        updatedAt: now,
        userName: aliceName,
        uid: uid,
        email: email,
        userImageURL: '');
    final Map<String, dynamic> userData = firestoreUser.toJson();
    await FirebaseFirestore.instance
        .collection(usersFieldKey)
        .doc(uid)
        .set(userData);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(snackBarText)));
    notifyListeners();
  }

  Future<void> createUser({required BuildContext context}) async {
    // firebase auth
    try {
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = result.user;
      final String uid = user!.uid;
      await createFirestoreUser(context: context, uid: uid);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  void toggleIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }
}
