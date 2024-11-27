import 'package:exler/screens/REVIEWEE_SCREENS/login/login_signup_component.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
        contentPadding: EdgeInsets.all(8),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))));
    final textStyle = TextStyle(color: Color(0xFF6C7278), fontSize: 16);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset('assets/images/pattern.png'),
                  Expanded(child: Container())
                ],
              ),
              Positioned.fill(
                top: 40,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 70,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Get Started Now",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Create an account or log in an account",
                      style: TextStyle(color: Color(0xFF6C7278), fontSize: 15),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      height: 50,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(5)),
                      child: TabBar(
                          indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: Colors.black,
                          unselectedLabelColor: const Color(0xFF7D7D91),
                          indicatorColor: Colors.transparent,
                          tabs: const [
                            Tab(
                                child: Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 18),
                            )),
                            Tab(
                                child: Text(
                              "Login",
                              style: TextStyle(fontSize: 18),
                            ))
                          ]),
                    ),
                    Expanded(
                      child: signup_component(
                          textStyle: textStyle,
                          inputDecoration: inputDecoration),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
