import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  //const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.line_axis),
        title: Text(
          'BMI Calculator',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(children: <Widget>[
        
        Expanded(
            
            child: Row(
            
          children: <Widget>[
            Expanded(
              child: ReusableContainerCard(colour: Color(0xFF1D1E33)),
            ),
            Expanded(
              child: ReusableContainerCard(colour: Color(0xFF1D1E33)),
            ),
          ],
        )),
         Expanded(child: ReusableContainerCard(colour: Color(0xFF1D1E33)),),
        Expanded(
            
            child: Row(
            
          children: <Widget>[
            Expanded(
              child: ReusableContainerCard(colour: Color(0xFF1D1E33)),
            ),
            Expanded(
              child: ReusableContainerCard(colour: Color(0xFF1D1E33)),
            ),
          ],
        )),
      ]),
    );
  }
}

class ReusableContainerCard extends StatelessWidget {
  // const ReusableContainerCard({super.key});

  Color colour;
  ReusableContainerCard({required this.colour});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
           color: colour),
    );
  }
}
