import 'package:exler/firebase/firebase_options.dart';
import 'package:exler/screens/onboarding/onb.dart';
import 'package:exler/screens/onboarding/onboarding_screen.dart';
import 'package:exler/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ExlerApp());
}

class ExlerApp extends StatelessWidget {
  const ExlerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash1Screen(),
    );
  }
}
