import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List currencies;
  HomePage(this.currencies);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List currencies;
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
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: widget.currencies.length,
              itemBuilder: (BuildContext context, int index) {
                final Map currency = widget.currencies[index];
                final MaterialColor color = _colors[index % _colors.length];
                return _getListItemUi(currency, color);
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile _getListItemUi(Map currency, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency["name"][0]),
      ),
      title: Text(
        currency["name"],
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: _getSubtitleText(
          currency['volume_1day_usd'], currency['volume_1hrs_usd']),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(double priceUsd, double perChange) {
    TextSpan priceTextWidget = TextSpan(
      text: "\$$priceUsd\n",
      style: TextStyle(
        color: Colors.black,
      ),
    );
    String perChangeText = "1 hour: \$$perChange";
    TextSpan perChangeWidget;

    if (perChange > 0) {
      perChangeWidget = TextSpan(
        text: perChangeText,
        style: TextStyle(
          color: Colors.green,
        ),
      );
    } else {
      perChangeWidget = TextSpan(
        text: perChangeText,
        style: TextStyle(
          color: Colors.red,
        ),
      );
    }
    return RichText(
      text: TextSpan(children: [priceTextWidget, perChangeWidget]),
    );
  }
}
