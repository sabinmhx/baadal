# Baadal: Weather App in Flutter

This is a simple weather app built using Flutter that provides real-time weather information based on the user's location. The app utilizes the OpenWeatherMap API to fetch weather data and displays it in a user-friendly interface.

## Features

- Get real-time weather information based on the user's location.
- View weather details such as temperature, humidity, wind speed, and weather conditions.
- Display weather forecast for the next 5 days.
- Automatically update the weather data at regular intervals.
- User-friendly interface with intuitive design.

## Screenshots
<p float="left">
    <img alt="Splash Screen" src="https://raw.githubusercontent.com/sabinmhx/baadal/master/screenshots/baadal_splash_screen.png" width="200" height="400"/>
    <img alt="Home Screen 1 Light" src="https://raw.githubusercontent.com/sabinmhx/baadal/master/screenshots/baadal_home_screen1_light.png" width="200" height="400"/>
    <img alt="Home Screen 1 Dark" src="https://raw.githubusercontent.com/sabinmhx/baadal/master/screenshots/baadal_home_screen1_dark.png" width="200" height="400"/>
    <img alt="Home Screen 2 Light" src="https://raw.githubusercontent.com/sabinmhx/baadal/master/screenshots/baadal_home_screen2_light.png" width="200" height="400"/>
    <img alt="Home Screen 2 Dark" src="https://raw.githubusercontent.com/sabinmhx/baadal/master/screenshots/baadal_home_screen2_dark.png" width="200" height="400"/>
</p>

## Installation

Follow these steps to run the app on your local machine:

1. Ensure you have Flutter installed. If not, follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install).

2. Clone this repository to your local machine using:
    ```
    git clone https://github.com/sabinmhx/baadal.git
    ```

3. Change the working directory to the project folder:
    ```
    cd baadal
    ``` 
4. Install the dependencies:
    ```
    flutter pub get
    ```

5. Get your API key from [OpenWeatherMap](https://openweathermap.org/appid) and run app with the api key using dart define.
    ```
    flutter run --dart-define=API_KEY=your_api_key_here
    ```
