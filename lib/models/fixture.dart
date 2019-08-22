// {
//   "event_key": "243014",
//   "event_date": "2019-12-20",
//   "event_time": "20:00",
//   "event_home_team": "Auxerre",
//   "home_team_key": "3051",
//   "event_away_team": "Nancy",
//   "away_team_key": "3047",
//   "event_halftime_result": null,
//   "event_final_result": null,
//   "event_ft_result": null,
//   "event_penalty_result": null,
//   "event_status": null,
//   "country_name": "France",
//   "league_name": "Ligue 2",
//   "league_key": "177",
//   "league_round": "Round 19",
//   "league_season": "2019\/2020",
//   "event_live": "0",
//   "goalscorers": [],
//   "substitutes": [],
//   "cards": [],
//   "lineups": {
//       "home_team": {
//           "starting_lineups": [],
//           "substitutes": [],
//           "coaches": []
//       },
//       "away_team": {
//           "starting_lineups": [],
//           "substitutes": [],
//           "coaches": []
//       }
//   },
//   "statistics": []
// }

class Fixture {
  final String eventDate;
  final String homeTeamName;
  final String eventAwayTeamName;
  final String eventFinalResult;
  final String eventId;

  Fixture(
    {
      this.eventDate,
      this.homeTeamName,
      this.eventAwayTeamName,
      this.eventFinalResult,
      this.eventId
    }
  );

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(
      eventAwayTeamName: json['event_away_team'],
      eventDate: json['event_date'],
      eventId: json['event_key'],
      eventFinalResult: json['event_final_result'],
      homeTeamName: json['event_home_team']
    );
  }
}