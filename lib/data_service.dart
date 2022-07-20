import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_application/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    final queryParameters = {
      'q': 'city',
      'appid': '7ff9493d3a66fda40633f18ee31d3db7',
      'units': 'imperial'
    };

    final uri = Uri.https(
        'api.openweathermap.org', 'data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);

    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
