// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/model.dart';


class ApiService {
  // Base URL of the API
  static const String baseUrl = 'https://api.tvmaze.com';

  // Fetch all shows
  static Future<List<Show>> fetchAllShows() async {
    final response = await http.get(Uri.parse('$baseUrl/search/shows?q=all'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((show) => Show.fromJson(show['show'])).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }

  // Fetch search results by search term
  static Future<List<Show>> searchShows(String searchTerm) async {
    final response = await http.get(Uri.parse('$baseUrl/search/shows?q=$searchTerm'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((show) => Show.fromJson(show['show'])).toList();
    } else {
      throw Exception('Failed to load search results');
    }
  }

  Future<List<Show>> fetchShows() async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));

    if (response.statusCode == 200) {
      // Parse the JSON response
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((show) => Show.fromJson(show['show'])).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }
}
