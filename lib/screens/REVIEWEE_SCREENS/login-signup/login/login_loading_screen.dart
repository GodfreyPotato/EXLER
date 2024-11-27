import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exler/screens/REVIEWEE_SCREENS/home/home_screen.dart';
import 'package:exler/screens/REVIEWEE_SCREENS/login-signup/error_screen.dart';
import 'package:flutter/material.dart';
import '../../../../firebase_functions/firebase_functions.dart';

class LoginLoadingScreen extends StatefulWidget {
  LoginLoadingScreen({super.key, required this.form});
  final Map<String, dynamic> form;

  @override
  State<LoginLoadingScreen> createState() => _LoginLoadingScreenState();
}

class _LoginLoadingScreenState extends State<LoginLoadingScreen> {
  bool isDone = false;
  @override
  void initState() {
    super.initState();
    signup();
  }

  void signup() async {
    try {
      DocumentSnapshot doc = await FIREBASE.loginAccount(widget.form, context);
      print("HERE IS THE OBJECT $doc");
      if (doc.exists && doc.data() != null) {
        print("Error hereeeeeeeeeeeeeeeeeeeeeeeeeeee1111");
        Map convertedMap = doc as Map;
        print("Error hereeeeeeeeeeeeeeeeeeeeeeeeeeee2");
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => HomeScreen(
                  form: convertedMap,
                )));
      } else {
        print("Empty ? $doc");
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => ErrorScreen()));
      }
    } catch (e) {
      print("Error hereeeeeeeeeeeeeeeeeeeeeeeeeeee");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => ErrorScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
