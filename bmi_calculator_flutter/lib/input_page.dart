import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import custom widget for gender icons
import 'icon_content.dart';
// import custom widget for reusable container card
import 'reusable_container_card.dart';
// import constant properties
import 'constants.dart';

GenderType? selectedGender;
int userHeight = 170;
int userWeight = 60;
int userAge = 30;

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
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainerCard(
                    customOnPress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    // Using Ternary Operation
                    colour: selectedGender == GenderType.male
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild: IconContent(
                        genderIcon: FontAwesomeIcons.mars, gendertType: "MALE"),
                  ),
                ),
                Expanded(
                  child: ReusableContainerCard(
                    // passing function
                    customOnPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    colour: selectedGender == GenderType.female
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild: IconContent(
                      genderIcon: FontAwesomeIcons.venus,
                      gendertType: "FEMALE",
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableContainerCard(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      // textBaseline is needed otherwise crossAxisAlignment throws error only in this case
                      textBaseline: TextBaseline.alphabetic,

                      children: <Widget>[
                        Text(
                          userHeight.toString(),
                          style: kValueLableTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        thumbColor: Color(0xFFEB1555),
                        // 0x29 = 16% opacity
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                      ),
                      child: Slider(
                        // toDouble() --> converts int into double
                        value: userHeight.toDouble(),
                        min: 50.0,
                        max: 300.0,
                        // activeColor: Colors.white,
                        // inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            // round() --> converts double into int
                            userHeight = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableContainerCard(
                    colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text(
                          userWeight.toString(),
                          style: kValueLableTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressedCustom: () {
                                setState(() {
                                  userWeight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressedCustom: () {
                                setState(() {
                                  userWeight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainerCard(
                    colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kLabelTextStyle),
                        Text(
                          userAge.toString(),
                          style: kValueLableTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressedCustom: () {
                                setState(() {
                                  userAge--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressedCustom: () {
                                setState(() {
                                  userAge++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            Container(
              // takes all width for all mobile devices
              width: double.infinity,
              height: kBottomContainerHeight,
              margin: EdgeInsets.only(top: 10.0),
              color: kBottomContainerColour,
            )
          ]),
    );
  }
}

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
