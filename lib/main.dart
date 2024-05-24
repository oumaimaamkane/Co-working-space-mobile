import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coworking Space',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E3954),
        ),
      ),
      initialRoute: AppRoutes.register,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
