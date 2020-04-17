import 'package:flutter/material.dart';
import 'package:fluttercrypto/data/crypto_data.dart';
import 'package:fluttercrypto/modules/crypto_presenter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements CryptoListViewContract {
  CryptoListPresenter _presenter;
  List<Crypto> _currencies;
  bool _isLoading;

  _HomePageState() {
    _presenter = CryptoListPresenter(this);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = true;
    _presenter.loadCurrencies();
  }

  final List<MaterialColor> _colors = [
    Colors.blue,
    Colors.indigo,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto App"),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: _currencies.length,
              itemBuilder: (BuildContext context, int index) {
                final Crypto currency = _currencies[index];
                final MaterialColor color = _colors[index % _colors.length];
                return _getListItemUi(currency, color);
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile _getListItemUi(Crypto currency, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency.name[0]),
      ),
      title: Text(
        currency.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: _getSubtitleText(currency.exchange_id, currency.website),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String exchangeId, String website) {
    print(exchangeId);
    TextSpan priceTextWidget = TextSpan(
      text: "$exchangeId\n",
      style: TextStyle(
        color: Colors.black,
      ),
    );
    String perChangeText = "website: $website";
    TextSpan perChangeWidget;

    perChangeWidget = TextSpan(
      text: perChangeText,
      style: TextStyle(
        color: Colors.green,
      ),
    );

    return RichText(
      text: TextSpan(children: [priceTextWidget, perChangeWidget]),
    );
  }

  @override
  void onLoadCryptoComplete(List<Crypto> items) {
    // TODO: implement onLoadCryptoComplete
    setState(() {
      _currencies = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadCryptoError() {
    // TODO: implement onLoadCryptoError
  }
}
