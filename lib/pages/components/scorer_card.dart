import 'package:flutter/material.dart';
import '../../models/scorer.dart';

class ScorerCard extends StatelessWidget {
  final Scorer scorer;
  final IconData profileIcon = IconData(59389, fontFamily: 'MaterialIcons');

  ScorerCard(this.scorer);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Center(
          child: Container(
            height: 90.0,
            width: MediaQuery.of(context).size.width * 0.90,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: cardInformation(scorer, profileIcon),
          ),
        ));
  }
}

Widget cardInformation(scorer, profileIcon) => Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Center(child: Icon(profileIcon, size: 32.0),),
        ),
        Expanded(
            flex: 4,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(scorer.name,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold))),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.topLeft,
                  child:
                      Text(scorer.teamName, style: TextStyle(fontSize: 15.0)),
                )),
              ],
            )),
        Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 1.0),
                        child: Text(scorer.goals,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 45.0,
                                color: Colors.grey[700])),
                      ))),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.topLeft,
                      child: Center(
                          child: Text(
                        'Goals',
                        style: TextStyle(fontSize: 16.0),
                      ))),
                ),
              ],
            ))
      ],
    );
