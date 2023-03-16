import 'package:flutter/material.dart';

import 'package:bmi_calculator_flutter/constants.dart';

// custom Button widget

class RoundIconButton extends StatelessWidget {
  // const RoundIconButton({super.key});

  final IconData? icon;
  final VoidCallback onPressedCustom;
  RoundIconButton({required this.icon, required this.onPressedCustom});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressedCustom,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
