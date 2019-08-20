import 'package:flutter/material.dart';
import './pages/league_standings.dart';
import './pages/onboarding.dart';
import './pages/home.dart';

class Router {
  static const String homeRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String standingsRoute = '/standings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home());
      case standingsRoute:
        var arguments = settings.arguments as List;
        var leagueKey = arguments[0] as String;
        var standings = arguments[1] as List<dynamic>;
        return MaterialPageRoute(builder: (_) => LeagueStandings(leagueKey: leagueKey, standings: standings));
      case onboardingRoute:
        return MaterialPageRoute(builder: (_) => Onboarding());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('hello')),
          )
        );
    }
  }

}