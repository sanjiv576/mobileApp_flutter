import 'package:flutter/material.dart';

const kBackGroundColor = Color.fromRGBO(0, 221, 157, 0.5);
const kLabelTextStyle = TextStyle(color: Colors.white);
const kTitleTextStyle = TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);
const kIconTitleTextStyle =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black);
const kDescriptionTextStyle = TextStyle(
    fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black);
const kButtomIconTextStyle = TextStyle(
  fontSize: 30.0,
  color: Colors.green,
);

void main() => runApp(SimpleCard());

class SimpleCard extends StatelessWidget {
  //  const SimpleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //   appBarTheme: AppBarTheme(color: kBackGroundColor),
        scaffoldBackgroundColor: kBackGroundColor,
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatelessWidget {
  //const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Card',
          textAlign: TextAlign.left,
          style: kTitleTextStyle,
        ),
        backgroundColor: kBackGroundColor,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Simple and easy to use app',
                style: kLabelTextStyle,
              ),
            ),
          ),
          ReusableRow(
            leftIcon: Icons.home,
            leftHeading: 'Home',
            leftDescription: 'Sweet Home',
            rightIcon: Icons.build,
            rightHeading: 'Address',
            rightDescription: 'Kathmandu, Nepal',
          ),
          SizedBox(
            height: 14.0,
          ),
          ReusableRow(
            leftIcon: Icons.home,
            leftHeading: 'Home',
            leftDescription: 'Sweet Home',
            rightIcon: Icons.build,
            rightHeading: 'Address',
            rightDescription: 'Kathmandu, Nepal',
          ),
          SizedBox(
            height: 14.0,
          ),
          ReusableRow(
            leftIcon: Icons.home,
            leftHeading: 'Home',
            leftDescription: 'Sweet Home',
            rightIcon: Icons.build,
            rightHeading: 'Address',
            rightDescription: 'Kathmandu, Nepal',
          ),
          SizedBox(
            height: 14.0,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Colors.white,
            ),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.home, size: 35.0,),
                SizedBox(width: 16.0,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Setting',
                      style: kIconTitleTextStyle,
                    ),
                    Text(
                      'Description here',
                      style: kDescriptionTextStyle,
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

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
                  description: leftDescription.toString()),
            ),
            SizedBox(
              width: 14.0,
            ),
            Expanded(
              child: Reusable_Expanded_Category(
                icon: rightIcon,
                title: rightHeading.toString(),
                description: rightDescription.toString(),
              ),
            ),
          ],
        ));
  }
}

class Reusable_Expanded_Category extends StatelessWidget {
  // const Reusable_Expanded_Category({
  //   Key? key,
  // }) : super(key: key);

  final IconData? icon;
  final String? title;
  final String? description;

  Reusable_Expanded_Category(
      {required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
