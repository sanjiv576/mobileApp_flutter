import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_expanded_category.dart';
import '../components/reusable_row.dart';

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
       // backgroundColor: kBackGroundColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
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
              rightIcon: Icons.hotel,
              rightHeading: 'Hotel',
              rightDescription: 'Comfortable accomudation',
            ),
            SizedBox(
              height: 14.0,
            ),
            ReusableRow(
              leftIcon: Icons.credit_card,
              leftHeading: 'Bank',
              leftDescription: 'Place for banking',
              rightIcon: Icons.flight,
              rightHeading: 'Flight Reservation',
              rightDescription: 'Book flight and Fly',
            ),
            SizedBox(
              height: 14.0,
            ),
            ReusableRow(
              leftIcon: Icons.inventory,
              leftHeading: 'Logistic',
              leftDescription: 'Inventory materials',
              rightIcon: Icons.password,
              rightHeading: 'Password',
              rightDescription: 'Contains all passwords',
            ),
            SizedBox(
              height: 14.0,
            ),
            Expanded(
                child: GestureDetector(
              onTap: () {
                print('Setting');
                Navigator.pushNamed(context, '/setting');
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  color: Colors.white,
                ),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.settings,
                      size: 45.0,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
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
              ),
            ))
          ],
        ),
      ),
    );
  }
}
