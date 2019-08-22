import 'package:flutter/material.dart';
import '../../models/player.dart';

class PlayerCard extends StatelessWidget {
  final Player player;

  PlayerCard(this.player);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Container(
              height: 130.0,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: cardInformation(player)),
        ),
    );
  }
}

Widget cardInformation(player) => Column(children: <Widget>[
  Expanded(child: Row(
    children: <Widget>[
      Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 20.0),
            child: Column(
            children: <Widget>[
              Expanded(child: Container(alignment: Alignment.bottomLeft, child: Text(player.name, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)))),
              Expanded(child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(alignment: Alignment.topLeft, child: Text('No. ${player.number} - Age ${player.age} - ${player.country}')),
              )),
            ],
        ),
          ),
      ),
      Expanded(
          child: Column(
          children: <Widget>[
            Expanded(child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(alignment: Alignment.bottomRight, child: Text(player.type)),
            ))
          ],
        ),
      )
    ],
  )),
  Divider(indent: 20.0, endIndent: 20.0,),
  Expanded(child: Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: Row(
      children: <Widget>[
        Expanded(flex: 1, child: Column(
          children: <Widget>[
            Container(alignment: Alignment.centerLeft,child: Text('Matchs: ${player.matchs}', style: TextStyle(fontSize: 16),)),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(alignment: Alignment.centerLeft,child: Text('Goals: ${player.goals}', style: TextStyle(fontSize: 16))),
            ),
          ],
        )),
        Expanded(flex: 1, child: Column(
          children: <Widget>[
            Container(alignment: Alignment.centerLeft,child: Text('Yellow Card: ${player.yellowCards}', style: TextStyle(fontSize: 16))),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(alignment: Alignment.centerLeft,child: Text('Red Card: ${player.redCards}', style: TextStyle(fontSize: 16))),
            ),
          ],
        )),
        Expanded(flex: 1, child: SizedBox())
      ],
    ),
  )),
],);