# Weatherly — A Clean Weather App (Flutter)

Weatherly is a minimal yet powerful **Flutter weather app** that fetches current weather data by city name.  
It showcases **API integration, async programming, error handling, state management with Riverpod, and clean UI** — perfect for learning and demonstrating Flutter skills.

---

## Features (MVP)
- Search weather by city name
- Display current weather:
  - Temperature
  - Weather description
  - Humidity
  - Wind speed
  - Weather icon
  - City name
- Loading and error states
- Mark favorite cities (saved with `shared_preferences`)
- Dark & light themes
- 📸 Screenshots + clean README

---

## 🛠 Tech Stack
- **Flutter** (cross-platform UI)
- **Riverpod** (state management)
- **HTTP** (API requests)
- **Flutter Dotenv** (environment variables for API keys)
- **Shared Preferences** (local persistence for favorites)
- **Cached Network Image** *(optional)*

---

## Project Structure
lib/
├─ main.dart
├─ models/
│
└─ weather.dart
|
├─ screenshots/
│   ├─ search.png
│   ├─ details.png
│   └─ favorites.png
├─ services/
│ └─ weather_service.dart
├─ providers/
│ └─ weather_providers.dart
├─ screens/
│ ├─ search_screen.dart
│ ├─ weather_detail_screen.dart
│ └─ favorites_screen.dart
└─ widgets/
└─ weather_card.dart


---

## API Setup (OpenWeatherMap)
Weatherly uses the [OpenWeatherMap API](https://openweathermap.org/api) (free tier).  

1. Get a free API key by signing up at [OpenWeatherMap](https://home.openweathermap.org/users/sign_up).
2. Copy the `.env.example` file into `.env`:
```bash
   cp .env.example .env
   ```
3. Open .env and replace with your API key:
```bash
   API_KEY=YOUR_API_KEY_HERE
   ```


## Running the App

1. Install dependencies:
```bash
   flutter pub get
   ```

2. Run the app:
```bash
   -flutter run
```
The app will launch on your connected emulator or device.

## Screenshots

| Search Screen | Weather Details | Favorites |
|---------------|-----------------|-----------|
| ![Search](screenshots/search.PNG) | ![Details](screenshots/weather_details.PNG) | ![Favorites1](screenshots/favorites1.PNG) | ![Favorites2](screenshots/favorites2.PNG) |

## Author

Developed by Favoured Mwange as part of an internship project showcase.
Contact: mwangefavoured@gmail.com
GitHub: https://github.com/Fevado

