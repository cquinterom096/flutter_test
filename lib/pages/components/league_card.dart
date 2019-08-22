import 'package:flutter/material.dart';
import '../../models/league.dart';

class LeagueCard extends StatelessWidget {
  final League league;
  final List<dynamic> standings;

  LeagueCard(this.league, this.standings);

  @override
  Widget build(BuildContext context) {
    // Main card Alignments and size
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/standings', arguments: [league.id, league.leagueName, standings]);
        },
        child: Center(
          child: Container(
              height: 130.0,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: cardInformation(league)),
        ),
      ),
    );
  }
}

// Card information Rows and Columns
Widget cardInformation(League league) => Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[cardTitle(league), cardCountry(league)],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[cardCountryId(league), cardDefaultText(league)],
          ),
        ),
      ],
    );

// Card Components Text and Style
Widget cardTitle(League league) => Expanded(
      child: Container(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(
              league.leagueName,
              style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold),
            ),
          )),
    );

Widget cardCountry(League league) => Expanded(
      child: Container(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(league.countryName,
                style: TextStyle(fontSize: 20.0, color: Colors.grey[600])),
          )),
    );

Widget cardCountryId(League league) => Expanded(
      child: Container(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Text(
              league.id,
              style: TextStyle(
                  fontSize: 23.0,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold),
            ),
          )),
    );

Widget cardDefaultText(League league) => Expanded(
      child: Container(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Text('Country',
                style: TextStyle(fontSize: 16.5, color: Colors.grey[600])),
          )),
    );
