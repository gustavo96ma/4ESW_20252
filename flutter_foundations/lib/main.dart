import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('asdasd!', style: TextStyle(color: Colors.blue, fontSize: 46)),
            Text(
              textAlign: TextAlign.center,
              'xcvxcvx!',
              style: TextStyle(color: Colors.blue, fontSize: 46),
            ),
          ],
        ),
      ),
    );
  }
}
