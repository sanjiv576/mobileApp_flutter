import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[400],
        appBar: AppBar(
        backgroundColor: Colors.blue[800],
          title: const Text(
            'Ask me Anything',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40.0),
          ),
        ),
        body: MagicBall(),
      ),
    ),
  );
}

class MagicBall extends StatefulWidget {
  // const MagicBall({super.key});

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ansImage = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        ansImage = Random().nextInt(5) + 1;
                      });
                    },
                    child: Image.asset("images/ball$ansImage.png")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
