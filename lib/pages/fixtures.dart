import 'package:flutter/material.dart';
import './components/custom_app_bar.dart';
import '../api/data_fetcher.dart';
import './components/fixture_card.dart';

class Fixtures extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FixturesState();
  }
}

class _FixturesState extends State<Fixtures> {
  List<dynamic> fixtures = [];

  @override
  void initState() {
    super.initState();
    _setFixtures();
  }

  _setFixtures() async {
    List<dynamic> fetchedScorers = await DataFetcher.fetchFixtures();
    setState(() {
      fixtures.addAll(fetchedScorers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // MAIN STACK IS THE WHOLE SCREEN COLOR
          Container(color: Colors.grey[300]),
          // APPBAR STACKED ON TOP
          CustomAppBar('Fixtures', Color.fromRGBO(133, 96, 249, 1.0)),
          // Fixtures CArd
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: ListView.builder(
              itemCount: fixtures.length,
              itemBuilder: (BuildContext context, int index) {
                return FixtureCard(fixtures[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}