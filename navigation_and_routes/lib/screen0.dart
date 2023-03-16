import 'package:flutter/material.dart';

class Screen0 extends StatelessWidget {
  const Screen0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 0'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('Go to Screen 1'),
            onPressed: () {
              Navigator.pushNamed(context, '/first');
            },
          ),
          SizedBox(height: 15.0,),
          ElevatedButton(
            child: Text('Go to Screen 2'),
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
        ],
      )),
    );
  }
}
