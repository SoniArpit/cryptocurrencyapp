import 'dart:convert';

import 'package:fluttercrypto/data/crypto_data.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class ProdCryptoRepository implements CryptoRepository {
  String cryptoUrl = "https://rest.coinapi.io/v1/exchanges";

  @override
  Future<List<Crypto>> fetchCurrencies() async {
    // TODO: implement fetchCurrencies
    http.Response response = await http.get(cryptoUrl);
    final List responseBody = jsonDecode(response.body);
    final statusCode = response.statusCode;
    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException("An error occured : [code: $statusCode]");
    }

    // here getting from response body (from api) and pass to Crypto class
    return responseBody.map((c) => Crypto.fromMap(c)).toList();
  }
}
