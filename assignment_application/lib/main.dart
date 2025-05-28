import 'package:flutter/material.dart';
import 'screens/calculator_screen.dart';

void main() {
  runApp(CrazyCalculatorApp());
}

class CrazyCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '無茶苦茶電卓',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      home: CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
