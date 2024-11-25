import 'package:exler/screens/role/role_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textStyleTitle = TextStyle(
        color: Color(0xFF002F63), fontSize: 30, fontWeight: FontWeight.w500);
    var textStyleContent = TextStyle(
        color: Color(0xFF002F63), fontSize: 18, fontWeight: FontWeight.w400);
    return Scaffold(
      body: OnBoardingSlider(
          skipIcon: Icon(
            Icons.chevron_right,
            size: 30,
            color: Colors.white,
          ),
          controllerColor: Color(0xFF2C6ABD),
          addController: true,
          totalPage: 3,
          headerBackgroundColor: Colors.transparent,
          background: [Container(), Container(), Container()],
          speed: 1,
          skipTextButton: Text("Skip"),
          onFinish: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => RoleScreen()));
          },
          finishButtonStyle:
              FinishButtonStyle(backgroundColor: Color(0xFF2C6ABD)),
          finishButtonText: 'Continue',
          pageBodies: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/cloud.png',
                    width: 190,
                  ),
                  Container(
                    width: 200,
                    child: Center(
                      child: Text(
                        "Cloud-Based Platform",
                        style: textStyleTitle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 320,
                    child: Center(
                      child: Text(
                        "A digital platform that connects students with qualified review provider.",
                        style: textStyleContent,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/customize.png',
                    width: 190,
                  ),
                  Container(
                    width: 200,
                    child: Center(
                      child: Text(
                        "Personalized Learning",
                        style: textStyleTitle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 320,
                    child: Center(
                      child: Text(
                        "Students can access review materials, mock tests, and AI-powered personalized learning paths.",
                        style: textStyleContent,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/cheap.png',
                    width: 190,
                  ),
                  Container(
                    width: 200,
                    child: Center(
                      child: Text(
                        "Flexible Pricing",
                        style: textStyleTitle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 320,
                    child: Center(
                      child: Text(
                        "Various pricing options are available, including installment plans, scholarships, and discounts. ",
                        style: textStyleContent,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
    );
  }
}
