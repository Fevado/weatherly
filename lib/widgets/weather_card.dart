// import 'package:flutter/material.dart';
// import '../models/weather.dart';

// class WeatherCard extends StatelessWidget {
//   final Weather weather;

//   const WeatherCard({super.key, required this.weather});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       margin: const EdgeInsets.symmetric(vertical: 12),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Text(
//               weather.cityName,
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             const SizedBox(height: 12),
//             Image.network(
//               "https://openweathermap.org/img/wn/${weather.icon}@2x.png",
//               height: 100,
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 12),
//             Text(
//               "${weather.temperature}°C",
//               style: Theme.of(context).textTheme.displayMedium,
//             ),
//             Text(
//               weather.description,
//               style: Theme.of(context).textTheme.titleMedium,
//             ),
//             const Divider(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _infoTile("💧 Humidity", "${weather.humidity}%"),
//                 _infoTile("🌬 Wind", "${weather.windSpeed} m/s"),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _infoTile(String label, String value) {
//     return Column(
//       children: [
//         Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
//         const SizedBox(height: 4),
//         Text(value, style: const TextStyle(fontSize: 16)),
//       ],
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/weather.dart';
import '../providers/favorites_provider.dart';

class WeatherCard extends ConsumerWidget {
  final Weather weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final isFavorite = favorites.contains(weather.cityName);

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  weather.cityName,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.redAccent : Colors.grey,
                  ),
                  onPressed: () {
                    if (isFavorite) {
                      ref.read(favoritesProvider.notifier).removeCity(weather.cityName);
                    } else {
                      ref.read(favoritesProvider.notifier).addCity(weather.cityName);
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            Image.network(
              "https://openweathermap.org/img/wn/${weather.icon}@2x.png",
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            Text(
              "${weather.temperature}°C",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              weather.description,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _infoTile("💧 Humidity", "${weather.humidity}%"),
                _infoTile("🌬 Wind", "${weather.windSpeed} m/s"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
