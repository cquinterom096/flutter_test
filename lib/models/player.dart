//       {
//           "player_key": 4021324733,
//           "player_name": "Sourzac Martin",
//           "player_number": "16",
//           "player_country": "France",
//           "player_type": "Goalkeepers",
//           "player_age": "27",
//           "player_match_played": "0",
//           "player_goals": "0",
//           "player_yellow_cards": "0",
//           "player_red_cards": "0"
//       }

class Player {
  final String id;
  final String name;
  final String number;
  final String country;
  final String type;
  final String age;
  final String goals;
  final String yellowCards;
  final String redCards;
  final String matchs;

  Player(
    {
      this.id,
      this.name,
      this.number,
      this.country,
      this.type,
      this.age,
      this.goals,
      this.yellowCards,
      this.redCards,
      this.matchs
    }
  );

  factory Player.fromJson(Map<String,dynamic> json) {
    return Player(
      id: json['player_key'].toString(),
      name: json['player_name'],
      number: json['player_number'],
      country: json['player_country'],
      type: json['player_type'],
      age: json['player_age'],
      goals: json['player_goals'],
      yellowCards: json['player_yellow_cards'],
      redCards: json['player_red_cards'],
      matchs: json['player_match_played']
    );
  }
}
