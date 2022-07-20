import 'package:flutter/material.dart';
import 'package:weather_application/data_service.dart';
import 'package:weather_application/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _cityNameController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_response != null)
              Column(
                children: [
                  Image.network(_response.iconUrl),
                  Text(
                    '${_response.tempInfo.temperature}°',
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(_response.weatherInfo.description)
                ],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 150,
                child: TextField(
                  controller: _cityNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'City name',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _search,
              style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              child: const Text('Search'),
            ),
          ],
        )),
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityNameController.text);
    setState(() => _response = response);
  }
}
