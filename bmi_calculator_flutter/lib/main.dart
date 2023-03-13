import 'package:flutter/material.dart';
import 'input_page.dart';
// 1D1E33
void main() => runApp(BmiCalculator());

class BmiCalculator extends StatelessWidget {
  // const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Color(0xFF0A0E21)),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}
