import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Onboarding extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnboardingState();
  }
}

class _OnboardingState extends State<Onboarding> {
  int currentIndexPage;
  int pageLength;

  @override
  void initState() {
    currentIndexPage = 0;
    pageLength = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // MAIN STACK IS THE WHOLE SCREEN COLOR
          Container(color: Colors.white),
          // SLIDER OF THE ONBOARDING
          PageView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned(
                      top: 120.0,
                      right: 10.0,
                      child: Image.asset('assets/ChistianoBackground.png')),
                  Positioned(
                      top: 100.0,
                      left: 100.0,
                      child: Image.asset('assets/Christiano.png')),
                  Positioned(
                      left: -15.0,
                      bottom: -80.0,
                      child: Image.asset('assets/RedBottomNav.png'))
                ],
              ),
              Stack(
                children: <Widget>[
                  Positioned(
                      top: 120.0,
                      right: 10.0,
                      child: Image.asset('assets/MessiBackground.png')),
                  Positioned(
                      top: 150.0,
                      left: 50.0,
                      child: Image.asset('assets/Messi.png')),
                  Positioned(
                      left: -15.0,
                      bottom: -80.0,
                      child: Image.asset('assets/BlueBottomNav.png'))
                ],
              ),
              Stack(
                children: <Widget>[
                  Positioned(
                      top: 160.0,
                      right: 65.0,
                      child: Image.asset('assets/YokoBackground.png')),
                  Positioned(
                      top: 160.0,
                      left: 20.0,
                      child: Image.asset('assets/Yoko.png')),
                  Positioned(
                      left: -15.0,
                      bottom: -80.0,
                      child: Image.asset('assets/PurpleBottomNav.png')),
                  Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 750.0),
                        child: Container(
                          width: 340,
                          height: 50,
                          child: RaisedButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                            },
                              child: const Text(
                                'Get Started',
                                style: TextStyle(fontSize: 21)
                              ),
                            ),
                        ),
                      ),
                  )
                ],
              ),
            ],
            onPageChanged: (value) {
              //this widget sets the index to each children respectively
              setState(() => currentIndexPage = value);
            },
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 500.0),
              child: Text('Lorem Ipsum',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 570.0),
              child: Text('Lorem Ipsume Dolor Set',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 650.0),
              child: DotsIndicator(
                dotsCount: pageLength,
                position: currentIndexPage,
                decorator: DotsDecorator(
                    color: Colors.white70, activeColor: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
