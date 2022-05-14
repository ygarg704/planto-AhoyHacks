import 'package:planto/Model/get_api_data.dart';
import 'package:planto/Model/get_location.dart';

const weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = 'fdf749891e0d7cd980f460e2d5da564d';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    /// await for methods that return future
    Location location = Location();
    await location.getCurrentLocation();

    /// Get location data
    ///&units=metric change the temperature metric
    ///

    NetworkData networkHelper = NetworkData(
        '$weatherApiUrl?lat=${location.latitude}&lon=${location.longitide}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
