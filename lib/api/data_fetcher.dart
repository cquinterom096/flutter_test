import 'package:http/http.dart' show get;
import '../models/standing.dart';
import '../models/league.dart';
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
}