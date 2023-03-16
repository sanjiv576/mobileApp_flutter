import 'package:flutter/material.dart';
import 'package:navigation_and_routes/screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: ElevatedButton(
        child: Text('Go to Screen 2'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Screen2();
          }));
        },
      )),
    );
  }
}
