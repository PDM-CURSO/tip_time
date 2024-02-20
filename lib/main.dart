import 'package:flutter/material.dart';
import 'package:tip_time/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TipTime App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: HomePage(),
    );
  }
}
