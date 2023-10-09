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
    <img alt="Loading Screen" src="https://raw.githubusercontent.com/sabinmhx/baadal/master/assets/screenshots/baadal_loading_screen.png" width="200" height="400"/>
    <img alt="Home Screen 1" src="https://raw.githubusercontent.com/sabinmhx/baadal/master/assets/screenshots/baadal_home_screen1.png" width="200" height="400"/>
    <img alt="Home Screen 2" src="https://raw.githubusercontent.com/sabinmhx/baadal/master/assets/screenshots/baadal_home_screen2.png" width="200" height="400"/>
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
4. Get your API key from [OpenWeatherMap](https://openweathermap.org/appid) and replace the placeholder in `lib/api_key.dart`:
    ```
    const apiKey = "ENTER_YOUR_API_KEY_HERE";
    ```
5. Install the dependencies:
    ```
    flutter pub get
    ```

6. Run the app:
    ```
    flutter run
    ```

## Dependencies

The following packages are used in this project:

- `geolocator`: A Flutter geolocation plugin for Android and iOS devices.
- `geocoding`: A Flutter geocoding plugin to convert addresses into geographic coordinates and vice versa.
- `get`: A state management package for Flutter applications that simplifies navigation and dialog management.
- `http`: A package for making HTTP requests in Flutter.
- `intl`: A Flutter package for internationalization and localization support.
- `sleek_circular_slider`: A Flutter package to create custom circular sliders.

## Test Device
- Pixel 3XL API 34

## Credits
Project Credit: [Backslash Flutter](https://www.youtube.com/watch?v=yZG_S3P7Ng4)

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

For any inquiries or questions, feel free to contact me at sabinmhx@gmail.com.

