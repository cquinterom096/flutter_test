import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import './onboarding.dart';

class FadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FadingScreenState();
  }
}

class _FadingScreenState extends State<FadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 450.0, right: 100),
        child: SplashScreen(
          seconds: 3,
          navigateAfterSeconds: Onboarding(),
          image: Image.asset('assets/FirstIcon.png'),
          backgroundColor: Colors.white,
          photoSize: 100.0,
          loaderColor: Colors.white,
        ),
      ),
    );
  }
}