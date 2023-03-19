import 'package:flutter/material.dart';

import '../constants.dart';

class Reusable_Expanded_Category extends StatelessWidget {
  // const Reusable_Expanded_Category({
  //   Key? key,
  // }) : super(key: key);

  final IconData? icon;
  final String? title;
  final String? description;

  final VoidCallback onPressedCustom;

  Reusable_Expanded_Category(
      {required this.icon,
      required this.title,
      required this.description,
      required this.onPressedCustom});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedCustom,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.red,
              size: 70.0,
            ),
            Text(
              title.toString(),
              style: kIconTitleTextStyle,
            ),
            Text(description.toString(), style: kDescriptionTextStyle)
          ],
        ),
      ),
    );
  }
}
