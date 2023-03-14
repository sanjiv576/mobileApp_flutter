import 'package:flutter/material.dart';

class ReusableContainerCard extends StatelessWidget {
  // const ReusableContainerCard({super.key});

  final Color colour;
  final Widget? cardChild;
  ReusableContainerCard({required this.colour, this.cardChild});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), color: colour),
      child: cardChild,
    );
  }
}
