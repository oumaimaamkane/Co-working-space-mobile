import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  final String title;

  const Subtitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    );
  }
}
