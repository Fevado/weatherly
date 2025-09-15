import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../widgets/weather_card.dart';

class WeatherDetailScreen extends StatelessWidget {
  final Weather weather;

  const WeatherDetailScreen({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WeatherCard(weather: weather),
    );
  }
}
