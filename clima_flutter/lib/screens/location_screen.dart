import 'package:clima_flutter/services/networking.dart';
import '../screens/city_screen.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({required this.locationWeather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temperature;
  String? weatherMessage;
  String? cityName;
  String? weatherIcon;

  WeatherModel weatherModel = WeatherModel();

// note: this executes only once,
  @override
  void initState() {
    super.initState();
    // initialize the temperature, cityName and condition
    //when LocationScreen window opens

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      // Note: probable of getting null in  weatherData because of wrong apiKey, no internet, disable location in mobile phone
      // preventing from crash
      if (weatherData == null) {
        temperature = 0;
        cityName = 'unknown';
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get data';
        return;
      }
      // get temp value from the Internet
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      // get weather message from WeatherModel class
      weatherMessage = weatherModel.getMessage(temperature!);
      cityName = weatherData['name'];
      int condition = weatherData['weather'][0]['id'];
      // get the icon from WeatherModel class
      weatherIcon = weatherModel.getWeatherIcon(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.locationWeather);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData =
                          await WeatherModel().getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    // since push is an async function and 'await' is used, so 'async' is used in the function body
                    onPressed: () async {
                      // here comes the user given city name
                      //when the user clicked on 'Get Weather' button
                      // since push is an async function, so 'await' is used
                      // ---> how do i know ?
                      // --> while hovering push, Future<T> is dispalyed so it shows it is an async function
                      var userGivenCityName = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen()),
                      );
                      // display the city weather if it is not null
                      if (userGivenCityName != null) {
                        var cityWeatherData = await weatherModel.getCityWeather(
                            cityName: userGivenCityName);
                        updateUI(cityWeatherData);
                      }
                    },

                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°C',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "$weatherMessage in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
