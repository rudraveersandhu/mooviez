// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/model.dart';


class ApiService {

  static const String baseUrl = 'https://api.tvmaze.com';

  static Future<List<Show>> fetchAllShows() async {
    final response = await http.get(Uri.parse('$baseUrl/search/shows?q=all'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((show) => Show.fromJson(show['show'])).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }

  static Future<List<Show>> searchShows(String searchTerm) async {
    final response = await http.get(Uri.parse('$baseUrl/search/shows?q=$searchTerm'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((show) => Show.fromJson(show['show'])).toList();
    } else {
      throw Exception('Failed to load search results');
    }
  }

}
