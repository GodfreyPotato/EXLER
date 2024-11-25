import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Get Started Now",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Create an account or log in an account",
                      style: TextStyle(color: Color(0xFF6C7278), fontSize: 15),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      height: 60,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(5)),
                      child: TabBar(
                          indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: Colors.black,
                          unselectedLabelColor: Color(0xFF7D7D91),
                          indicatorColor: Colors.transparent,
                          tabs: [
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
                      child: TabBarView(children: [
                        Column(
                          children: [Text("Login")],
                        ),
                        Column(
                          children: [Text("Signup")],
                        )
                      ]),
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
