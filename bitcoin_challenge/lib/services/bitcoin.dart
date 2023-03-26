import 'dart:convert';

import 'package:http/http.dart' as http;
import '../api_key.dart';

class Bitcoin {
 // double? rate;
  Future<dynamic> getData({required String currency}) async {
    String url =
        'https://rest.coinapi.io/v1/exchangerate/BTC/$currency?apiKey=$apiKey';

    http.Response response = await http.get(Uri.parse(url));
    var decodedData = jsonDecode(response.body);

    return decodedData['rate'];
  }
}
