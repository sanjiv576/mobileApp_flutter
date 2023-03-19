import 'package:flutter/material.dart';
import '../constants.dart';

class Login extends StatelessWidget {
  // const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Hello Again!',
                      style: kTextStyle,
                    ),
                    Text("Wellcome back you've \n been missed!",textAlign: TextAlign.center, style: kMsgTextStyle,)
                  ],
                ),
              ),
            ),
            // I was here last time
            Expanded(flex: 2, child: Container(color: Colors.blue, child: Column(children: <Widget>[],),)),
            Expanded(child: Container(color: Colors.yellow)),
          ],
        ),
      ),
    );
  }
}
