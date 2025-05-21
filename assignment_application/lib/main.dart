import 'package:flutter/material.dart';
import 'screens/calculator_screen.dart';

void main() {
  runApp(WackyCalculatorApp());
}

class WackyCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wacky Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: CalculatorScreen(),
    );
  }
}
