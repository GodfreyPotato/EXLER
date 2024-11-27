import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FIREBASE {
  static Future<void> createAccount(Map<String, dynamic> info) async {
    try {
      UserCredential auth = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: info['email'], password: info['password']);

      User? user = auth.user;

      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set(info);
      }
    } catch (e) {}
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> loginAccount(
      Map<String, dynamic> info, BuildContext context) async {
    DocumentSnapshot<Map<String, dynamic>>? doc;
    try {
      UserCredential auth = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: info['email'], password: info['password']);

      User? user = auth.user;

      if (user != null) {
        doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        return doc;
      } else {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Text("Something went wrong"),
                ));
        return doc!;
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: Text("Invalid Input"),
              ));
      return doc!;
    }
  }
}
