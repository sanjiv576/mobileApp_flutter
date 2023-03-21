import 'package:flutter/material.dart';
import 'package:sign_in_up/constants.dart';

class MyHomepage extends StatelessWidget {
  // const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          //  color: Colors.black,
          margin: EdgeInsets.all(14.0),
          child: Column(children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                //  color: Colors.red,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34.0),
                    color: Color(0xFFD798F7)),
                child: Image(image: NetworkImage('images/backgroundd.png')),
              ),
            ),
            SizedBox(
              height: 35.0,
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    'Discover your',
                    style: kTextStyle,
                  ),
                  //    SizedBox(height: 3.0,),
                  Text(
                    'Dream job Here',
                    style: kTextStyle,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    'Explore all the most exiting jobs roles \n based on your interest And study major',
                    style: kparaTextStyle,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Expanded(
              // flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: KActiveButtonColor,

                      padding: EdgeInsets.all(24.0),
                      // textStyle: TextStyle(fontSize: 44.0),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text('Register', style: kButtonTextStyle),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kInactiveButtonColor,
                      padding: EdgeInsets.all(24.0),
                      // textStyle: TextStyle(fontSize: 44.0),
                      side: BorderSide(color: Colors.white, width: 3),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text('Signin', style: kButtonTextStyle),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
