class League {
  final String id;
  final String leagueName;
  final String countryId;
  final String countryName;

  League({this.id, this.leagueName, this.countryId, this.countryName});

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json['league_key'],
      leagueName: json['league_name'],
      countryId: json['country_key'],
      countryName: json['country_name']
    );
  }
}