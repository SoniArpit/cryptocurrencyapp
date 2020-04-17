// dummy data

import 'package:fluttercrypto/data/crypto_data.dart';

class MockCryptoRepository implements CryptoRepository {
  @override
  Future<List<Crypto>> fetchCurrencies() {
    // TODO: implement fetchCurrencies
    return Future.value(currencies);
  }
}

var currencies = <Crypto>[
  Crypto(
    name: "Binance",
    exchange_id: "BINANCE",
    website: "https://www.binance.com/",
  ),
  Crypto(
    name: "Kraken",
    exchange_id: "KRAKEN",
    website: "https://www.kraken.com/",
  ),
  Crypto(
    name: "Gemini",
    exchange_id: "GEMINI",
    website: "https://gemini.com/",
  ),
];
