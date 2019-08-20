import 'package:flutter/material.dart';
import './components/league_card.dart';
import './components/custom_app_bar.dart';

class Home extends StatelessWidget {
  final List<dynamic> leagues;
  final List<dynamic> standings;

  Home({this.leagues, this.standings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // MAIN STACK IS THE WHOLE SCREEN COLOR
          Container(color: Colors.grey[300]),
          // APPBAR STACKED ON TOP
          CustomAppBar('Leagues', Colors.redAccent),
          // LEAGUE CARD BUILT BY THE API DATA
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: ListView.builder(
              itemCount: leagues.length,
              itemBuilder: (BuildContext context, int index) {
                return LeagueCard(leagues[index], standings);
              },
            ),
          )
        ],
      ),
    );
  }
}
