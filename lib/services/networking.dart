import 'package:dweather/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.lat, required this.lon});

  final double lat;
  final double lon;

  Future getData() async {
    try {
      final String url =
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$kAPI_KEY&units=metric';
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      }else{
        return jsonDecode(response.statusCode.toString());
      }
    } catch (e) {
      print(e);
    }
  }
}
