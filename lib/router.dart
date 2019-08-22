import 'package:flutter/material.dart';
import './pages/league_standings.dart';
import './pages/top_scorers.dart';
import './pages/fixtures.dart';
import './pages/onboarding.dart';
import './pages/home.dart';
import './pages/team_viewer.dart';
import './pages/fading_screen.dart';

class Router {
  static const String homeRoute = '/home';
  static const String onboardingRoute = '/onboarding';
  static const String standingsRoute = '/standings';
  static const String topScorersRoute = '/top_scorers';
  static const String fixturesRoute = '/fixtures';
  static const String teamRoute = '/team';
  static const String splashRoute = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home());
      case splashRoute:
        return MaterialPageRoute(builder: (_) => FadingScreen());
      case standingsRoute:
        var arguments = settings.arguments as List;
        var leagueKey = arguments[0] as String;
        var leagueName = arguments[1] as String;
        var standings = arguments[2] as List<dynamic>;
        return MaterialPageRoute(builder: (_) => LeagueStandings(leagueKey: leagueKey, leagueName: leagueName, standings: standings));
      case teamRoute:
        var arguments = settings.arguments as List;
        var teamKey = arguments[0] as String;
        var teamName = arguments[1] as String;
        return MaterialPageRoute(builder: (_) => TeamViewer(teamKey: teamKey, teamName: teamName));
      case fixturesRoute:
        return MaterialPageRoute(builder: (_) => Fixtures());
      case topScorersRoute:
        return MaterialPageRoute(builder: (_) => TopScorers());
      case onboardingRoute:
        return MaterialPageRoute(builder: (_) => Onboarding());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Wrong Route oops!')),
          )
        );
    }
  }

}