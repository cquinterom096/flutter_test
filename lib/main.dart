import 'package:flutter/material.dart';
import './api/data_fetcher.dart';
import './pages/home.dart';
import './router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<dynamic> leagues = [];
  List<dynamic> standings = [];

  @override
  void initState() {
    super.initState();
    _setLeagues();
    _setStandings();
  }

  _setLeagues() async {
    List<dynamic> fetchedLeagues = await DataFetcher.fetchLeagues();
    setState(() {
      leagues.addAll(fetchedLeagues);
    });
  }

  _setStandings() async {
    List<dynamic> fetchedStandings = await DataFetcher.fetchStandings();
    setState(() {
      standings.addAll(fetchedStandings);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      home: Home(leagues: leagues, standings: standings),
    );
  }
}