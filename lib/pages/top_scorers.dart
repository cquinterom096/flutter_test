import 'package:flutter/material.dart';
import './components/custom_app_bar.dart';
import '../api/data_fetcher.dart';
import './components/scorer_card.dart';

class TopScorers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TopScorersState();
  }
}

class _TopScorersState extends State<TopScorers> {
  List<dynamic> topScorers = [];

  @override
  void initState() {
    super.initState();
    _setTopScorers();
  }

  _setTopScorers() async {
    List<dynamic> fetchedScorers = await DataFetcher.fetchTopScorers();
    setState(() {
      topScorers.addAll(fetchedScorers);
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
          CustomAppBar('Top Scorers', Color.fromRGBO(133, 96, 249, 1.0)),
          // TOPSCORER CARD
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: ListView.builder(
              itemCount: topScorers.length,
              itemBuilder: (BuildContext context, int index) {
                return ScorerCard(topScorers[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}