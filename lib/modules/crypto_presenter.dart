import 'package:fluttercrypto/data/crypto_data.dart';
import 'package:fluttercrypto/dependency_injection.dart';

abstract class CryptoListViewContract {
  void onLoadCryptoComplete(List<Crypto> items);
  void onLoadCryptoError();
}

class CryptoListPresenter {
  CryptoListViewContract _view;
  CryptoRepository _repository;

  CryptoListPresenter(this._view) {
    // only once bcz its singleton
    _repository = new Injector().crpytoRepository;
  }

  void loadCurrencies() {
    _repository
        .fetchCurrencies()
        .then((c) => _view.onLoadCryptoComplete(c))
        .catchError((onError) => _view.onLoadCryptoError());
  }
}
