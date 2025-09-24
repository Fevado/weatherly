import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/weather.dart';
import '../services/weather_service.dart';

// Read API key from --dart-define
const String apiKey = String.fromEnvironment('API_KEY', defaultValue: "");

// Service provider
final weatherServiceProvider = Provider<WeatherService>((ref) {
  if (apiKey.isEmpty) {
    throw Exception("API_KEY not set");
  }
  return WeatherService(apiKey);
});

// FutureProvider for async weather fetching by city
final weatherProvider = FutureProvider.family<Weather, String>((ref, city) async {
  final service = ref.watch(weatherServiceProvider);
  return await service.fetchWeatherByCity(city);
});
