import 'package:exler/screens/REVIEWEE_SCREENS/login-signup/login_signup_screen.dart';
import 'package:flutter/material.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 70,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome to Exler",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Select a role",
                    style: TextStyle(color: Color(0xFF6C7278), fontSize: 22),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 1,
                          color: const Color.fromARGB(255, 189, 189, 189))
                    ]),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: Size(330, 140),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        onPressed: () {},
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/lecturer.png',
                              width: 90,
                            ),
                            Text(
                              "Lecturer",
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xFF7E8A8C)),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 1,
                          color: const Color.fromARGB(255, 189, 189, 189))
                    ]),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: Size(330, 140),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => LoginScreen()));
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/reviewee.png',
                              width: 90,
                            ),
                            Text(
                              "Reviewee",
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xFF7E8A8C)),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
