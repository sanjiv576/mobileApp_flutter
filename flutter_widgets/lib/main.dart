import 'package:flutter/material.dart';

import 'screens/dashboard.dart';
import 'screens/my_form_textfield.dart';
import 'screens/my_text_filed.dart';
void main() => runApp(MyWidgets());

class MyWidgets extends StatelessWidget {
  // const MyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => MyDashboard(),
        '/myTextField': (context) => MyTextField(),
        '/myTextFormField': (context) => MyTextFormField(),
      },
    );
  }
}