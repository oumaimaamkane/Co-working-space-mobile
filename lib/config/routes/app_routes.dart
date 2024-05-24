// lib/config/routes/app_routes.dart

import 'package:flutter/material.dart';
// import 'package:your_project/features/events.dart';
// import 'package:your_project/features/about.dart';
// import 'package:your_project/features/profile.dart';
import 'package:coworking_space_mobile/features/home.dart';
import 'package:coworking_space_mobile/features/contact.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/views/screens/login.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/views/screens/register.dart';

class AppRoutes {
  static const String home = '/home';
  static const String events = '/events';
  static const String about = '/about';
  static const String contact = '/contact';
  static const String profile = '/profile';
  static const String login = '/login';
  static const String register = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      // case events:
      //   return MaterialPageRoute(builder: (_) => EventsScreen());
      // case about:
      //   return MaterialPageRoute(builder: (_) => AboutScreen());
      case contact:
        return MaterialPageRoute(builder: (_) => ContactScreen());
      // case profile:
      //   return MaterialPageRoute(builder: (_) => ProfileScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
