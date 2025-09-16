import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A StateNotifier provider that holds a list of favorite city names.

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<String>>((ref) {
  return FavoritesNotifier();
});

class FavoritesNotifier extends StateNotifier<List<String>> {
  static const String _prefsKey = 'favorites';
  FavoritesNotifier() : super([]) {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getStringList(_prefsKey) ?? [];
  }

  Future<void> addCity(String city) async {
    final normalized = city.trim();
    if (normalized.isEmpty) return;
    if (!state.any((c) => c.toLowerCase() == normalized.toLowerCase())) {
      final updated = [...state, normalized];
      state = updated;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_prefsKey, updated);
    }
  }

  Future<void> removeCity(String city) async {
    final normalized = city.trim().toLowerCase();
    final updated = state.where((c) => c.toLowerCase() != normalized).toList();
    state = updated;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_prefsKey, updated);
  }
}
