import 'package:flutter/material.dart';
import '../constants.dart';
import 'reusable_expanded_category.dart';

class ReusableRow extends StatelessWidget {
  // const ReusableRow({  Key? key, }) : super(key: key);

  IconData? leftIcon;
  String? leftHeading;
  String? leftDescription;

  IconData? rightIcon;
  String? rightHeading;
  String? rightDescription;

  ReusableRow(
      {required this.leftIcon,
      required this.leftHeading,
      required this.leftDescription,
      required this.rightIcon,
      required this.rightHeading,
      required this.rightDescription});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Reusable_Expanded_Category(
                  icon: leftIcon,
                  title: leftHeading.toString(),
                  description: leftDescription.toString(),
                  onPressedCustom: () {
                    print(leftHeading);
                    Navigator.pushNamed(context, '/home');
                  }),
            ),
            SizedBox(
              width: 14.0,
            ),
            Expanded(
              child: Reusable_Expanded_Category(
                  icon: rightIcon,
                  title: rightHeading.toString(),
                  description: rightDescription.toString(),
                  onPressedCustom: () {
                    print(rightHeading);
                  }),
            ),
          ],
        ));
  }
}
