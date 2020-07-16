import 'package:flutter/material.dart';
import 'package:weathercondition/pages/homepage.dart';
import 'package:weathercondition/pages/loading.dart';
import 'package:weathercondition/pages/selectcity.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/cities': (context) => SelectCities(),
  }));
}
