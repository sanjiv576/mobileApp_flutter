import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  // to play different sound
  void playSound(int noteTone) {
    final player = AudioPlayer();
    player.play(AssetSource('note$noteTone.wav'));
  }

Expanded buildKey({var colorName, var soundNumber}){
    return Expanded(
                child: Container(
                  color: colorName,
                  child: TextButton(
                    onPressed: () {
                      playSound(soundNumber);
                    },
                    child: Text(''),
                  ),
                ),
              );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(colorName: Colors.red, soundNumber:1),
              buildKey(colorName: Colors.blue, soundNumber:2),
              buildKey(colorName: Colors.yellow, soundNumber:3),
              buildKey(colorName: Colors.pink, soundNumber:4),
              buildKey(colorName: Colors.orange, soundNumber:5),
              buildKey(colorName: Colors.green, soundNumber:6),
              buildKey(colorName: Colors.purple, soundNumber:7),

              ],
          ),
        ),
      ),
    );
  }
}
