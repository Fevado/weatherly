import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/weather_providers.dart';
import '../widgets/weather_card.dart';
import './favorites_screen.dart';


class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();
  String? _searchedCity;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weatherly"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Enter city name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _searchedCity = _controller.text.trim();
                    });
                  },
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Weather results
            if (_searchedCity != null && _searchedCity!.isNotEmpty)
              Expanded(
                child: ref.watch(weatherProvider(_searchedCity!)).when(
                      data: (weather) => WeatherCard(weather: weather),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (err, _) =>
                          Center(child: Text("⚠️ $err")),
                    ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    FloatingActionButton(
                      onPressed: (){
                        // ✅ Redirect to FavoritesScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const FavoritesScreen()),
                    );
                      },
                      child: Icon(Icons.favorite),)
                  ],
                ),
              )

            
          ],
        ),
      ),
    );
  }
}

