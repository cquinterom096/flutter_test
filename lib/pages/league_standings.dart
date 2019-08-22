import 'package:flutter/material.dart';
import './components/custom_app_bar.dart';
import './components/app_bar_actions.dart';

class LeagueStandings extends StatefulWidget {
  final String leagueKey;
  final String leagueName;
  final List<dynamic> standings;

  LeagueStandings(
      {Key key,
      @required this.leagueKey,
      @required this.standings,
      @required this.leagueName})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LeagueStandingsState();
  }
}

class _LeagueStandingsState extends State<LeagueStandings> {
  List<dynamic> leagueFilteredStandings = [];

  @override
  void initState() {
    super.initState();
    _leagueFilteredStandings();
  }

  _leagueFilteredStandings() {
    List<dynamic> filteredList = widget.standings
        .where((standing) => standing.leagueKey == widget.leagueKey)
        .toList();
    return setState(() => leagueFilteredStandings.addAll(filteredList));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // MAIN STACK IS THE WHOLE SCREEN COLOR
          Container(color: Colors.grey[300]),
          // APPBAR STACKED ON TOP
          CustomAppBar(widget.leagueName, Colors.redAccent, showButtons: true),

          // CustomAppBar Actions
          AppBarActions(),
          // STANDINGS LIST
          Padding(
              padding:
                  const EdgeInsets.only(top: 120.0, left: 20.0, right: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white),
                child: ListView.builder(
                  itemCount: leagueFilteredStandings.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    Widget standingTableElement;
                    if (index == 0) {
                      standingTableElement = header();
                    } else {
                      standingTableElement = standingRow(context,
                          leagueFilteredStandings[index - 1], index - 1);
                    }
                    return standingTableElement;
                  },
                ),
              )),
        ],
      ),
    );
  }
}

Widget header() => Row(
      children: <Widget>[
        Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text('Standings', style: TextStyle(fontSize: 17.0)),
            )),
        Expanded(child: Text('G', style: TextStyle(fontSize: 12))),
        Expanded(child: Text('E', style: TextStyle(fontSize: 12))),
        Expanded(child: Text('P', style: TextStyle(fontSize: 12))),
        Expanded(child: Text('PTS', style: TextStyle(fontSize: 12)))
      ],
    );

Widget standingRow(context, standing, index) => Padding(
      padding: const EdgeInsets.only(top: 11.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/team',
              arguments: [standing.teamKey, standing.teamName]);
        },
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text('${index + 1} ${standing.teamName}',
                      style: TextStyle(fontSize: 17.0)),
                )),
            Expanded(child: Text(standing.g, style: TextStyle(fontSize: 16))),
            Expanded(child: Text(standing.e, style: TextStyle(fontSize: 16))),
            Expanded(child: Text(standing.p, style: TextStyle(fontSize: 16))),
            Expanded(
                child: Text(standing.points, style: TextStyle(fontSize: 16)))
          ],
        ),
      ),
    );
