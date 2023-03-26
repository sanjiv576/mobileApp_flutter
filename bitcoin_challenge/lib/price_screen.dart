import 'package:flutter/material.dart';
import 'coin_data.dart';
// for ios picker
import 'package:flutter/cupertino.dart';
import '../services/bitcoin.dart';

// to know which platform either android or ios ,
// currently this app is running so we import dart:io
// Note: show keyword is used here to access only Platform class of dart:io not extra other classes
// Similarly, hide keyword is used for accessing all without specific class
//e.g import 'dart:io' hide Platform;

import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectCurrency = 'USD';
  String rateUI = '?';

// for Android Dropdown

  DropdownButton androidDropdownButton() {
    // list of dropdown menu items
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      dropdownItems.add(
        DropdownMenuItem(
          value: currency,
          child: Text(currency),
        ),
      );
    }

    return DropdownButton<String>(
      value: selectCurrency,
      // calling a dropDownItems method to show list of currencies
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectCurrency = value;
          getCoinData(selectCurrency!);
          print(selectCurrency);
        });
      },
    );
  }

  // for IOS dropdown by Cupertino picker

  CupertinoPicker iosPicker() {
    return CupertinoPicker(
      itemExtent: 45.0,
      backgroundColor: Colors.lightBlue,
      onSelectedItemChanged: (selectedIndex) {
        // print(selectedIndex);
        selectCurrency = currenciesList[selectedIndex];
        // get new coin value
        getCoinData(selectCurrency!);
        print('$selectedIndex : $selectCurrency');
      },
      children: getPickerItems(),
    );
  }

  List<Text> getPickerItems() {
    List<Text> items = [];
    for (String currency in currenciesList) {
      items.add(Text(currency));
    }
    return items;
  }

  // show appropriate dropdown depending on ios or android
  //by check on which platform currently this app is running
// Note: this method is not used here, instead of it , it is used by using ternary operator in dropdown
  Widget getPicker() {
    if (Platform.isIOS) {
      return iosPicker();
    } else if (Platform.isAndroid) {
      return androidDropdownButton();
    }
    return androidDropdownButton();
  }

  Future<dynamic> getCoinData(String selectCurrency) async {
    Bitcoin b = Bitcoin();
    // print('Start');
    var rate = await b.getData(currency: selectCurrency);

   // print("Rate: $rate");
   // print('end');

    setState(() {
      rate = rate.toInt();
      rateUI = rate.toString();
    });

    return rate;
  }

  @override
  void initState() {
    super.initState();
   // print('Uper start');
    getCoinData(selectCurrency!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            //  padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ReusableCard(
                    changeCurrencyName: 'BTC',
                    rateUI: rateUI,
                    selectCurrency: selectCurrency),
                ReusableCard(
                    changeCurrencyName: 'ETH',
                    rateUI: rateUI,
                    selectCurrency: selectCurrency),
                ReusableCard(
                    changeCurrencyName: 'LTC',
                    rateUI: rateUI,
                    selectCurrency: selectCurrency),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            // show appropriate dropdown depending on ios or android
            //by check on which platform currently this app is running
            child: Platform.isIOS ? iosPicker() : androidDropdownButton(),
          )
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final String? changeCurrencyName;
  const ReusableCard(
      {Key? key,
      required this.rateUI,
      required this.selectCurrency,
      required this.changeCurrencyName})
      : super(key: key);

  final String rateUI;
  final String? selectCurrency;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $changeCurrencyName = $rateUI $selectCurrency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
