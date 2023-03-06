import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

// use Stateful Widget when the state of UI is to be changed as users interact with it
class DicePage extends StatefulWidget {
  // const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceImg = 1;
  int rightDiceImg = 1;

  // roll both dice if the any button is pressed on
  void rollBothDice() {
    // setState() --> used here to update values instantly that are used in Image Widget  as the values get changed
    setState(() {
      rightDiceImg = Random().nextInt(6) + 1;
      leftDiceImg = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    void rollBothDice() {
      setState(() {
        rightDiceImg = Random().nextInt(6) + 1;
        leftDiceImg = Random().nextInt(6) + 1;
      });
    }

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  // call rollBothDice function to roll both dice
                  onPressed: rollBothDice,
                  child: Image.asset('images/dice$leftDiceImg.png')),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  // call rollBothDice function to roll both dice
                  onPressed: rollBothDice,
                  child: Image.asset('images/dice$rightDiceImg.png')),
            ),
          ),
        ],
      ),
    );
  }
}

// Stateless Widget does not change UI as users interact with UI so using now Stateful Widget
// class DicePage extends StatelessWidget {

// }
