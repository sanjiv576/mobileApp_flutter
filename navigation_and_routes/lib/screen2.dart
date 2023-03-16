import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
          child: ElevatedButton(
        child: Text('Go back'),
        onPressed: () {
          // navigate to previous page
          Navigator.pop(context);
        },
      )),
    );
  }
}
