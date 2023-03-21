import 'package:flutter/material.dart';
import '../constants.dart';



class ReusableExpanded extends StatelessWidget {
  // const ReusableExpanded({Key? key,}) : super(key: key);

  final String? iconUrl;
  final VoidCallback onPressedCustom;

  ReusableExpanded({required this.iconUrl, required this.onPressedCustom});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
          onPressed: onPressedCustom,
          style: ElevatedButton.styleFrom(
            backgroundColor: kInactiveButtonColor,
            padding: EdgeInsets.all(17.0),
            // textStyle: TextStyle(fontSize: 44.0),
            side: BorderSide(color: Colors.white, width: 3),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: Image(
            image: NetworkImage(iconUrl.toString()),
          )),
    );
  }
}
