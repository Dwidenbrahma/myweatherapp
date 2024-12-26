import 'dart:convert';

import 'package:dweather/services/location.dart';
import 'package:dweather/services/networking.dart';
import 'package:dweather/utilities/constants.dart';
import 'package:http/http.dart' as http;


class WeatherModel {

  Future<dynamic>getByCity(String cityName) async{
    String url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$kAPI_KEY&units=metric';
    http.Response response = await http.get(Uri.parse(url));
    var weatherData = response.body;
    return jsonDecode(weatherData);
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getLocation();
     double currentLon = location.longitude;
    double currentLat = location.latitutde;
    NetworkHelper network = NetworkHelper(lat: currentLat, lon: currentLon);
    var weather = await network.getData();

    return weather;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
