import 'package:http/http.dart' as http;

class DataService {
  void getWeather() {
    final uri = Uri.https('api.openweathermap.org', 'data/2.5/weather');
  }
}
