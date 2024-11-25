import 'package:exler/screens/role/role_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';

class Onb extends StatelessWidget {
  Onb({super.key});
  final pages = [
    PageModel(
        color: Colors.amber,
        imageAssetPath: 'assets/images/cloud.png',
        title: 'Screen 1',
        body: 'Share your ideas with the team',
        doAnimateImage: true),
    PageModel(
        color: Colors.cyan,
        imageAssetPath: 'assets/images/customize.png',
        title: 'Screen 2',
        body: 'See the increase in productivity & output',
        doAnimateImage: true),
    PageModel(
        color: Colors.purple,
        imageAssetPath: 'assets/images/cheap.png',
        title: 'Screen 3',
        body: 'Connect with the people from different places',
        doAnimateImage: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: pages,
        finishCallback: () => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => RoleScreen())),
        skipCallback: () => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => RoleScreen())),
      ),
    );
  }
}
