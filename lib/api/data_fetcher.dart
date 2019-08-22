import 'package:http/http.dart' show get;
import '../models/standing.dart';
import '../models/league.dart';
import '../models/scorer.dart';
import '../models/fixture.dart';
import '../models/team.dart';
import 'dart:convert';

// ONLY GET METHODS
class DataFetcher {
  static Future<List<dynamic>> fetchLeagues() async {
    final response = await get('https://allsportsapi.com/api/football/?met=Leagues&APIkey=0417a02fa7bd904841f6a0aabf0748f25dbb4206ddeac6e79dc2bd3c9eac2935');

    // ? is the optional operator
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse['result'].map((league) => League.fromJson(league)).toList();
    } else {
      throw Exception('Failed to load leagues');
    }
  }

  static Future<List<dynamic>> fetchStandings() async {
    final response = await get('https://allsportsapi.com/api/football/?met=Standings&APIkey=0417a02fa7bd904841f6a0aabf0748f25dbb4206ddeac6e79dc2bd3c9eac2935&leagueId=177');

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse['result']['total'].map((standing) => Standing.fromJson(standing)).toList();
    } else {
      throw Exception('Failed to load leagues');
    }
  }

  static Future<List<dynamic>> fetchTopScorers() async {
    final response = await get('https://allsportsapi.com/api/football/?met=Topscorers&APIkey=0417a02fa7bd904841f6a0aabf0748f25dbb4206ddeac6e79dc2bd3c9eac2935&leagueId=177');

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse['result'].map((scorer) => Scorer.fromJson(scorer)).toList();
    } else {
      throw Exception('Failed to load leagues');
    }
  }

  static Future<List<dynamic>> fetchFixtures() async {
    final response = await get('https://allsportsapi.com/api/football/?met=Fixtures&APIkey=0417a02fa7bd904841f6a0aabf0748f25dbb4206ddeac6e79dc2bd3c9eac2935&leagueId=177&from=2019-07-1&to=2019-12-31');

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse['result'].map((fixture) => Fixture.fromJson(fixture)).toList();
    } else {
      throw Exception('Failed to load leagues');
    }
  }

  static Future<List<dynamic>> fetchTeams() async {
    final response = await get('https://allsportsapi.com/api/football/?met=Teams&teamId=3047&APIkey=0417a02fa7bd904841f6a0aabf0748f25dbb4206ddeac6e79dc2bd3c9eac2935');

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse['result'].map((team) => Team.fromJson(team)).toList();
    } else {
      throw Exception('Failed to load leagues');
    }
  }
}