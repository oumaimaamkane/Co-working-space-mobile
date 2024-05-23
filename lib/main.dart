import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E3954), // Set the color here
        ),
      ),
      home: HomePage(), // Set your initial page here
    );
  }
}
