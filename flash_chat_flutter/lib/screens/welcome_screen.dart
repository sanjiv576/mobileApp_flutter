import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flutter/material.dart';

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
      print(animation!.value);
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
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    //Go to login screen.
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
