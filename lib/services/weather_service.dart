import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/weather.dart';

class WeatherService {
  static const String baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  final String apiKey;

  WeatherService(this.apiKey);

  Future<Weather> fetchWeatherByCity(String city) async {
    final url = Uri.parse("$baseUrl?q=$city&appid=$apiKey&units=metric");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Weather.fromJson(data);
    } else {
      throw Exception("Failed to load weather data: ${response.reasonPhrase}");
    }
  }
}
