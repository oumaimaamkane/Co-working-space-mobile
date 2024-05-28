import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/home.dart';
import 'package:coworking_space_mobile/features/contact.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/views/screens/login.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/views/screens/register.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/screens/dashmin.dart';
import 'package:coworking_space_mobile/features/Client/presentation/views/screens/profile.dart';

class AppRoutes {
  static const String home = '/home';
  static const String events = '/events';
  static const String about = '/about';
  static const String contact = '/contact';
  static const String clientProfile = '/profile';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashmin = '/dashmin';

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
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case dashmin:
        return MaterialPageRoute(builder: (_) => DashminScreen());
      case clientProfile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
