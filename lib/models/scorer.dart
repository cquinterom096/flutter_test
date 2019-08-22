// {
//   "player_place": "1",
//   "player_name": "Kadewere T.",
//   "player_key": 326756485,
//   "team_name": "Le Havre",
//   "team_key": "3057",
//   "goals": "6"
// }

class Scorer {
  final int id;
  final String position;
  final String name;
  final String goals;
  final String teamName;
  final String teamId;

  Scorer({this.id, this.position, this.name, this.goals, this.teamName, this.teamId});

  factory Scorer.fromJson(Map<String, dynamic> json) {
    return Scorer(
      id: json['player_key'],
      goals: json['goals'],
      name: json['player_name'],
      position: json['player_place'],
      teamName: json['team_name'],
      teamId: json['team_key']
    );
  }
}