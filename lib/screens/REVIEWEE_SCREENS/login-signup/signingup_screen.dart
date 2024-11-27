import 'package:exler/screens/REVIEWEE_SCREENS/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SigningupScreen extends StatefulWidget {
  SigningupScreen({super.key, required this.form});
  final Map form;

  @override
  State<SigningupScreen> createState() => _SigningupScreenState();
}

class _SigningupScreenState extends State<SigningupScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  @override
  void initState() {
    super.initState();
    createAccount();
  }

  Future<void> createAccount() async {
    try {
      // Create account using email and password
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: widget.form['email'], 
        password: widget.form['password']
      );

      // Get the current user
      User? user = userCredential.user;

      // If user is not null, add user details to Firestore
      if (user != null) {
        await firestore.collection('users').doc(user.uid).set({
          'firstname': widget.form['firstName'],
          'middlename': widget.form['middleName'],
          'lastname': widget.form['lastName'],
          'birthdate': widget.form['bdate'],
          'nationality': widget.form['nationality'],
          'gender': widget.form['gender'],
          'address': widget.form['address'],
          'zipcode': widget.form['zipcode'],
          'username': widget.form['username'],
          'email': widget.form['email'],
          'phone': widget.form['phone'],
          'education': widget.form['education'],
          'program': widget.form['program'],
          'university': widget.form['university']
          // Do not store passwords in Firestore for security reasons
        });

        // Navigate to HomeScreen after account creation
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomeScreen(form: widget.form))
        );
      }
    } catch (e) {
      print("Error Occurred: $e");
      // Show error message to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to create account: $e'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
