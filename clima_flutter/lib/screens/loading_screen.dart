import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

import '../api_key.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Location location;

  void getLocation() async {
    await location.getCurrentLocation();

    print('Latitude : ${location.latitude}');
    print('Longitude: ${location.longitude}');
  }

// immediately this method is called when the screen opens or LooadingScreen object is created
  @override
  void initState() {
    super.initState();

    location = Location();
    getLocation();
  }

// immediately this method is called when the screen is closed or popped

  @override
  void deactivate() {
    super.deactivate();
    print('Deactivating stateful widget');
  }

  void getData() async {
    String url =
        'https://api.openweathermap.org/data/2.5/weather?q=Kathmandu&appid=$apiKey';
    http.Response response = await http.get(Uri.parse(url));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
