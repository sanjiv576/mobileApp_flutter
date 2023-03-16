import 'package:flutter/material.dart';
import 'package:navigation_and_routes/screen0.dart';
import 'screen1.dart';
import 'screen2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   //   home: Screen1(),
  //  inital Page 
   initialRoute: '/',
  // routes of different pages in key and value pair -> using Navigation with named routes
   routes: {
    '/':(context) => Screen0(),
    '/first': (context) => Screen1(),
    '/second': (context) => Screen2()
   },
    );
  }
}
