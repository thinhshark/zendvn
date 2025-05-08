import 'package:calculator_app/screens/calculator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      home: CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
