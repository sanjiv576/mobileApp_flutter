import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableRoundedButton extends StatelessWidget {
  // const ReusableRoundedButton({  Key? key,}) : super(key: key);
  final String? nameText;
  final Color? colour;
  final VoidCallback? onPressCustom;

  ReusableRoundedButton(
      {required this.nameText,
      required this.colour,
      required this.onPressCustom});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressCustom,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            nameText.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
