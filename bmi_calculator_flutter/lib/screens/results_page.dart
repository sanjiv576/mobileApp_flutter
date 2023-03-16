import 'package:flutter/material.dart';
import '../components/reusable_container_card.dart';
import '../constants.dart';
// import input_page for custom BottomButton widget
import '../components/buttom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                  child: Text('Your Result', style: kTitleTextStyle))),
          Expanded(
              flex: 5,
              child: ReusableContainerCard(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'NORMAL',
                      style: KHealthStatusTextStyle,
                    ),
                    Text(
                      '56.1',
                      style: kCalculatedValueTextStyle,
                    ),
                    Text(
                      'health message',
                      style: kMessageTextStyle,
                    ),
                  ],
                ),
              )),
          BottomButtonCustom(
            buttonName: 'RE-CALCULATE',
            buttonFunction: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
