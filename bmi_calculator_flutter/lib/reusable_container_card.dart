import 'package:flutter/material.dart';

class ReusableContainerCard extends StatelessWidget {
  // const ReusableContainerCard({super.key});

  final Color colour;
  final Widget? cardChild;
  // function for higher order function
  //  Note: VoidCallback is just shorthand for void Function()
  final VoidCallback? customOnPress;
  ReusableContainerCard({required this.colour, this.cardChild, this.customOnPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // passing the customOnPress function
      onTap: customOnPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: colour),
        child: cardChild,
      ),
    );
  }
}
