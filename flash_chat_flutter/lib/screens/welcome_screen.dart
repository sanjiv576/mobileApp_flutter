import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/resuable_rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

// SingleTickerProviderStateMixin is used as a ticker
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // manager that manages/controls animations duration, start, stop, move forward or reverse
  AnimationController? controller;

  // another animation for curve animation
  Animation? animation;

// we need animation when the screen appears, so, using inside the initState()
  @override
  void initState() {
    super.initState();

// for linear animation
    controller = AnimationController(
      // how long the animation should complete ?
      duration: Duration(seconds: 3),
      // vsync works as a ticker --> ticker means like a ticking clock that counts the animation as the shape, color, size changes
      vsync: this,

      // Note: upperBound is 1 by default, and never while using in CurvedAnimation
      // it throws error because by default CurvedAnimaiton has 1.0 upperBound value not others
      // upperBound: 100,
    );

    // for non-linear animaiton
    animation = CurvedAnimation(parent: controller!, curve: Curves.decelerate);

    // move the animation forward
    controller!
        .forward(); // --> its status = AnimaitonStatus.completed (when it is completed)

    // loop animation

    // controller!.addStatusListener((status) {
    //   //  print(status);
    //   // animate reverse when the forward() is completed
    //   if (status == AnimationStatus.completed) {
    //     controller!.reverse(from: 1.0);
    //   }
    //   // animate forwared when the reverse() is dismissed
    //   else if (status == AnimationStatus.dismissed) {
    //     controller!.forward();
    //   }
    // });

    // for Tween animation
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller!);

    // observe the generating value between 0 and 1 by AnimationController,
    // for this we should listen it
    controller!.addListener(() {
      setState(() {});
      // print(controller!.value);
   //   print(animation!.value);
    });
  }

  // always dispose the animation for free space

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red.withOpacity(controller!.value),
      backgroundColor: animation!.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                // add Hero animation --> starting point
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    // height: animation!.value * 100,
                    height: 60.0,
                  ),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [TypewriterAnimatedText('Flash Chat')],
                    onTap: () {
                      print('Tap event');
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ReusableRoundedButton(
              nameText: 'Log in',
              colour: Colors.lightBlueAccent,
              onPressCustom: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            ReusableRoundedButton(
              nameText: 'Register',
              colour: Colors.blueAccent,
              onPressCustom: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
