import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_container_card.dart';

const bottomContainerHeight = 80.0;

const Color activeCardColour = Color(0xFF1D1E33);
const Color bottomContainerColour = Color(0xFFFEB1555);
const Color inactiveCardColour = Color(0xFF111328);
  GenderType? selectedGender;

// using enum for more readable instead of 0 , 1  for female and male
// used enum when you have many options
enum GenderType { male, female }

class InputPage extends StatefulWidget {
  //const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleColour = inactiveCardColour;
  // Color femaleColour = inactiveCardColour;
  
  // old code for gender selection , method is in the end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.line_axis),
        title: Text(
          'BMI Calculator',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(children: <Widget>[
        Expanded(
            child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // print("Male icon is tapped");
                  setState(() {
                    // old technique without using Ternary operator
                    // updateColour(gender: GenderType.male);

                    selectedGender = GenderType.male;
                  });
                },
                child: ReusableContainerCard(
                   // Using Ternary Operation

                  colour: selectedGender == GenderType.male
                        ? activeCardColour
                        : inactiveCardColour,
                  cardChild: IconContent(
                      genderIcon: FontAwesomeIcons.mars, gendertType: "MALE"),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    // old technique without using Ternary operator
                    // updateColour(gender: GenderType.female);

                    selectedGender = GenderType.female;
                  });
                },
                child: ReusableContainerCard(
                  colour: selectedGender == GenderType.female
                        ? activeCardColour
                        : inactiveCardColour,
                  cardChild: IconContent(
                    genderIcon: FontAwesomeIcons.venus,
                    gendertType: "FEMALE",
                  ),
                ),
              ),
            ),
          ],
        )),
        Expanded(
          child: ReusableContainerCard(colour: activeCardColour),
        ),
        Expanded(
            child: Row(
          children: <Widget>[
            Expanded(
              child: ReusableContainerCard(colour: activeCardColour),
            ),
            Expanded(
              child: ReusableContainerCard(colour: activeCardColour),
            ),
          ],
        )),
        Container(
          // takes all width for all mobile devices
          width: double.infinity,
          height: bottomContainerHeight,
          margin: EdgeInsets.only(top: 10.0),
          color: bottomContainerColour,
        )
      ]),
    );
  }
}

//  custom Widget was here i.e IconContent

//  custom Widget was here i.e ReusableContainerCard


// old code

// 0 - female, 1 - male
//   void updateColour({required GenderType gender}) {
//     // activate male and deactivate female background colour, if male is tapped
//     if (gender == GenderType.male) {
//       // if (maleColour == inactiveCardColour) {
//       //   maleColour = activeCardColour;
//       //   femaleColour = inactiveCardColour;
//       // } else {
//       //   maleColour = inactiveCardColour;
//       // }

// // used Ternary Operator to reduce above comment code
//       maleColour = maleColour != inactiveCardColour
//           ? inactiveCardColour
//           : activeCardColour;
//       femaleColour = inactiveCardColour;
//     }
//     // activate female & deactivate male background colour, if female is tapped
//     else {
//       // if (femaleColour == inactiveCardColour) {
//       //   femaleColour = activeCardColour;
//       //   maleColour = inactiveCardColour;
//       // } else {
//       //   femaleColour = inactiveCardColour;
//       // }

// // used Ternary Operator to reduce above comment code

//       femaleColour = femaleColour == activeCardColour
//           ? inactiveCardColour
//           : activeCardColour;
//       maleColour = inactiveCardColour;
//     }
//   }
