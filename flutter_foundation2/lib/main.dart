import 'package:flutter/material.dart';
import 'package:flutter_foundation2/custom_padding.dart';
import 'package:flutter_foundation2/screens/second_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomPadding(),
      routes: {'secondPage': (context) => const SecondScreen()},
    );
  }
}
