import 'dart:convert';
import 'package:http/http.dart' as http;
import 'crypto.dart';

Future<List<Crypto>> fetchCryptoData() async {
  final response = await http.get(
    Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'),
  );

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((cryptoJson) => Crypto.fromJson(cryptoJson)).toList();
  } else {
    throw Exception('Failed to load crypto data');
  }
}
