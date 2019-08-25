import 'package:flutter/material.dart';
import './pages/fading_screen.dart';
import './router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      home: FadingScreen()
    );
  }
}