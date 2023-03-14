import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(color: Color(0xFF8D8E98), fontSize: 18.0);

// custom Widget
class IconContent extends StatelessWidget {
  //const IconContent({ Key? key, }) : super(key: key);

  final IconData? genderIcon;
  final String? gendertType;
  IconContent({required this.genderIcon, required this.gendertType});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            genderIcon,
            //  Icons.male,
            size: 80.0,
            color: Colors.white,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            '$gendertType',
            style: labelTextStyle,
          )
        ]);
  }
}
