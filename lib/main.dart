import 'package:flutter/material.dart';

import 'homeScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildThemeData(),
      home: HomeScreen(),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
        primaryColor: Colors.blueGrey,
        backgroundColor: Colors.white10,
        textTheme: TextTheme(
          headline3: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
        ));
  }
}
