import 'package:exler/screens/REVIEWEE_SCREENS/login-signup/login_signup_screen.dart';
import 'package:flutter/material.dart';
import '../../../../firebase_functions/firebase_functions.dart';

class SignupLoadingScreen extends StatefulWidget {
  SignupLoadingScreen({super.key, required this.form});
  final Map<String, dynamic> form;

  @override
  State<SignupLoadingScreen> createState() => _SigningupScreenState();
}

class _SigningupScreenState extends State<SignupLoadingScreen> {
  bool isDone = false;
  @override
  void initState() {
    super.initState();
    signup();
  }

  void signup() async {
    await FIREBASE.createAccount(widget.form);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
