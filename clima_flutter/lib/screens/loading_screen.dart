import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import '../api_key.dart';
import '../screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
//  late Location location;

// immediately this method is called when the screen opens or LooadingScreen object is created
  @override
  void initState() {
    super.initState();

    // location = Location();
    getLocationData();
  }

// immediately this method is called when the screen is closed or popped
  @override
  void deactivate() {
    super.deactivate();
    print('Deactivating stateful widget');
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LocationScreen(
                  locationWeather: weatherData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitFadingCircle(
        color: Colors.white,
        size: 80.0,
      )),
    );
  }
}
