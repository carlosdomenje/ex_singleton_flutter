import 'package:flutter/material.dart';
import 'package:singleton_flutt/src/pages/home_page.dart';
import 'package:singleton_flutt/src/pages/second_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Singleton Ex',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'second': (_) => SecondPage()
      },
    );
  }
}
