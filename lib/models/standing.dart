// {
  //               "standing_place": "1",
  //               "standing_place_type": "Promotion - Ligue 1",
  //               "standing_team": "Lorient",
  //               "standing_P": "4",
  //               "standing_W": "3",
  //               "standing_D": "1",
  //               "standing_L": "0",
  //               "standing_F": "7",
  //               "standing_A": "2",
  //               "standing_GD": "5",
  //               "standing_PTS": "10",
  //               "team_key": "3044",
  //               "league_key": "177",
  //               "league_season": "2019\/2020",
  //               "league_round": "",
  //               "standing_updated": "2019-08-19 22:37:08"
//  }

class Standing {
  final String position;
  final String teamName;
  final String leagueKey;
  final String g;
  final String e;
  final String p;
  final String points;
  final String teamKey;

  Standing({this.position, this.teamName, this.leagueKey, this.g, this.e, this.p, this.points, this.teamKey});

  factory Standing.fromJson(Map<String, dynamic> json) {
    return Standing(
      position: json['standing_place'],
      teamName: json['standing_team'],
      leagueKey: json['league_key'],
      points: json['standing_PTS'],
      teamKey: json['team_key'],
      g: json['standing_P'],
      e: json['standing_W'],
      p: json['standing_W']
    );
  }
}
