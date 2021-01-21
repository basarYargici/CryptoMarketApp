import 'dart:io';

import 'package:cryptocurrency/model/model.dart';
import 'package:http/http.dart' as http;

class GetData {
  String cryptoUrl = "pro-api.coinmarketcap.com";

  static const String APIKey = "07ee11f0-4fe3-4379-b716-b7341c46745b";

  var queryParameters = {
    'start': '1',
    'limit': '80',
    'convert': 'USD',
  };

  Future<http.Response> getResponse() async {
    Uri uri = Uri.https(cryptoUrl, "/v1/cryptocurrency/listings/latest", queryParameters);
    http.Response response = await http.get(uri, headers: {HttpHeaders.acceptHeader: "application/json", "X-CMC_PRO_API_KEY": APIKey});
    return response;
  }

  Future<List<Coin>> getCoins() async {
    List<Coin> coins = List<Coin>();
    final response = await getResponse();
    print(response.body);
    final currency = currencyFromJson(response.body);
    coins = currency.data;
    return coins;
  }
}
