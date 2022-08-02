import 'package:bmi/constants.dart';
import 'package:bmi/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: cPrimaryColor,
        scaffoldBackgroundColor: cPrimaryColor,
      ),
      home: homepage(),
    );
  }
}
