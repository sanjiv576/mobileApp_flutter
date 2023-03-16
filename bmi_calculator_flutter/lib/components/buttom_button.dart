import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButtonCustom extends StatelessWidget {
  // const BottomButtonCustom({
  //   Key? key,
  // }) : super(key: key);

  final String? buttonName;
  final VoidCallback buttonFunction;

  BottomButtonCustom({required this.buttonName, required this.buttonFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonFunction,
      child: Container(
          // takes all width for all mobile devices
          width: double.infinity,
          height: kBottomContainerHeight,
          margin: EdgeInsets.only(top: 10.0),
          color: kBottomContainerColour,
          child: Center(
              child: Text(
            buttonName.toString(),
            style: kLargeButtonTextStyle,
          ))),
    );
  }
}
