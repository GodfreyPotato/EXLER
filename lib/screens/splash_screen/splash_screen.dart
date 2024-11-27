import 'package:exler/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash1Screen(),
    );
  }
}

class Splash1Screen extends StatefulWidget {
  const Splash1Screen({super.key});

  @override
  _Splash1ScreenState createState() => _Splash1ScreenState();
}

class _Splash1ScreenState extends State<Splash1Screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              Splash2Screen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF002F63),
      body: Center(
        child: FadeTransition(
          opacity: _controller,
          child: Image.asset(
            'assets/images/logo.png',
            width: 120,
          ),
        ),
      ),
    );
  }
}

class Splash2Screen extends StatelessWidget {
  const Splash2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => OnboardingScreen()));
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 120,
            ),
            Text(
              "EXLER",
              style: TextStyle(
                  color: Color(0xFF013D83),
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
