import 'package:flutter/material.dart';
import 'package:onboarding_postman_test/pages/components/scorer_card.dart';
import '../../models/fixture.dart';

class FixtureCard extends StatelessWidget {
  final Fixture fixture;
  final IconData teamIcon = IconData(59389, fontFamily: 'MaterialIcons');
  static final Map<int, String> weekdays = {
    1: 'Mon',
    2: 'Tues',
    3: 'Wed',
    4: 'Thur',
    5: 'Fri',
    6: 'Sat',
    7: 'Sun'
  };

  static final Map<int, String> months = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December'
  };

  FixtureCard(this.fixture);

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
            child: cardInformation(fixture, teamIcon),
          ),
        ));
  }
}

Widget cardInformation(fixture, teamIcon) => Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Center(child: Icon(teamIcon, size: 65.0)),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    fixture.homeTeamName,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    width: 300,
                    alignment: Alignment.bottomCenter,
                    child: Text(_dateString(fixture.eventDate))),
              ),
              Expanded(
                flex: 3,
                child: Center(
                    child: Text(
                  '${fixture.eventFinalResult is String ? fixture.eventFinalResult : '-'}',
                  style: TextStyle(fontSize: 29.0, fontWeight: FontWeight.w500),
                )),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Center(child: Icon(teamIcon, size: 65.0)),
              ),
              Expanded(
                  flex: 2,
                  child: Text(
                    fixture.eventAwayTeamName,
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
      ],
    );

String _dateString(eventDate) {
  var parsedDate = DateTime.parse(eventDate);
  String weekday = FixtureCard.weekdays[parsedDate.weekday];
  String month = FixtureCard.months[parsedDate.month];
  String day = parsedDate.day.toString();
  return '$weekday, $month $day';
}
