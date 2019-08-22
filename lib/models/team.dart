// {
//   "team_key": "3047",
//   "team_name": "Nancy",
//   "team_logo": "https:\/\/allsportsapi.com\/logo\/3047_nancy.png",
//   "players": [],
//   "coaches": []
// }

import './player.dart';

class Team {
  final String id;
  final String name;
  final String logo;
  final List<dynamic> players;

  Team({this.id, this.name, this.logo, this.players});

  factory Team.fromJson(Map<String,dynamic> json) {
    return Team(
      players: json['players'].map((p) => Player.fromJson(p)).toList(),
      name: json['team_name'],
      logo: json['team_logo'],
      id: json['team_key']
    );
  }
}