import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/setting.dart';
import 'constants.dart';
import '../components/input_page.dart';

void main() => runApp(SimpleCard());

class SimpleCard extends StatelessWidget {
  //  const SimpleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // hide debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //   appBarTheme: AppBarTheme(color: kBackGroundColor),
        scaffoldBackgroundColor: kBackGroundColor,
      ),
      //  home: InputPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/home': (context) => Home(),
        '/setting': (context) => Settings(),
      },
    );
  }
}
