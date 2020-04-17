import 'package:flutter/material.dart';
import 'package:fluttercrypto/dependency_injection.dart';
import 'home_page.dart';

void main() async {
  Injector.configure(Flavor.PROD);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      home: HomePage(),
    );
  }
}
