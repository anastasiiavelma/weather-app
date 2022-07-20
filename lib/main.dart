import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final cityNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("dfdf"),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 150,
                child: TextField(
                  controller: cityNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'City name',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
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
}
