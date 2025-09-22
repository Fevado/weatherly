import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/weather.dart';
import '../services/weather_service.dart';

// Replace with your real API key
final String apiKey = dotenv.env['API_KEY'] ?? "";

// Service provider
final weatherServiceProvider = Provider<WeatherService>((ref) {
  return WeatherService(apiKey);
});

// FutureProvider for async weather fetching by city
final weatherProvider = FutureProvider.family<Weather, String>((
  ref,
  city,
) async {
  final service = ref.watch(weatherServiceProvider);
  return await service.fetchWeatherByCity(city);
});
