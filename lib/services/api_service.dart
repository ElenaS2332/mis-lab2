import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:random_jokes_lab/models/joke.dart';

class ApiService {
  static Future<List<String>> getJokeCategories() async {
    const String apiUrl = 'https://official-joke-api.appspot.com/types';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jokeCategories = json.decode(response.body);
        return jokeCategories.map((json) => json.toString()).toList();
      } else {
        throw Exception('Failed to load joke categories');
      }
    } catch (exception) {
      throw Exception('Failed to retrieve data from api');
    }
  }

  static Future<List<Joke>> fetchJokes(String category) async {
    final String apiUrl =
        'https://official-joke-api.appspot.com/jokes/$category/ten';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jokeList = json.decode(response.body);
        return jokeList.map((json) => Joke.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load jokes');
      }
    } catch (exception) {
      throw Exception('Failed to retrieve data from api');
    }
  }

  static Future<Joke> fetchRandomJoke() async {
    const String apiUrl = 'https://official-joke-api.appspot.com/random_joke';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Joke.fromJson(data);
      } else {
        return Joke(
          setup: 'Failed to fetch joke',
          punchline: 'Please try again later.',
        );
      }
    } catch (exception) {
      return Joke(
        setup: 'An error occurred',
        punchline: 'Check your internet connection.',
      );
    }
  }
}
