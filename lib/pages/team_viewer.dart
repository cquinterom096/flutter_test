import 'package:flutter/material.dart';
import './components/custom_app_bar.dart';
import './components/player_card.dart';
import '../api/data_fetcher.dart';
import '../models/team.dart';

class TeamViewer extends StatefulWidget {
  final String teamKey;
  final String teamName;

  TeamViewer(
      {Key key,
      @required this.teamKey,
      @required this.teamName,
      })
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TeamViewerState();
  }
}

class _TeamViewerState extends State<TeamViewer> {
  Team currentTeam = Team(players: []);

  @override
  void initState() {
    super.initState();
    _setTeams();
  }

  _setTeams() async {
    List<dynamic> fetchedTeams = await DataFetcher.fetchTeams();
    var team = fetchedTeams.firstWhere((team) => team.id == widget.teamKey, orElse: () => null);

    if (team == null) {
      return;
    } else {
      setState(() {
        currentTeam = team;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // MAIN STACK IS THE WHOLE SCREEN COLOR
          Container(color: Colors.grey[300]),
          // APPBAR STACKED ON TOP
          CustomAppBar(widget.teamName, Color.fromRGBO(96, 116, 249, 1.0)),
          // Fixtures CArd
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: ListView.builder(
              itemCount: currentTeam.players.length,
              itemBuilder: (BuildContext context, int index) {
                return PlayerCard(currentTeam.players[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}