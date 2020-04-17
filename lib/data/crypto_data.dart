// model
import 'dart:async';

class Crypto {
  String name;
  String exchange_id;
  String website;

  Crypto({this.name, this.exchange_id, this.website});

  // named constructor
  // for prod class, for get from url api
  Crypto.fromMap(Map<String, dynamic> map)
      : name = map["name"],
        exchange_id = map["exchange_id"],
        website = map["website"];
}

abstract class CryptoRepository {
  Future<List<Crypto>> fetchCurrencies();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
