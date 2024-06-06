import 'package:get/get.dart';
import 'package:coworking_space_mobile/features/home.dart';
import 'package:coworking_space_mobile/features/contact.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/views/screens/login.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/views/screens/register.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/screens/dashmin.dart';
import 'package:coworking_space_mobile/features/Client/presentation/views/screens/profile_view.dart';
import 'package:coworking_space_mobile/features/Client/presentation/views/screens/update_profile_view.dart';

class AppRoutes {
  static const String home = '/home';
  static const String events = '/events';
  static const String about = '/about';
  static const String contact = '/contact';
  static const String clientProfile = '/profile';
  static const String login = '/login';
  static const String register = '/register';
  static const String dashmin = '/dashmin';
  static const String updateProfile = '/updateProfile';

  static final pages = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: contact, page: () => const ContactScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: register, page: () => const SignUpScreen()),
    GetPage(name: dashmin, page: () => const DashminScreen()),
    GetPage(name: clientProfile, page: () => ProfileView()),
    GetPage(name: updateProfile, page: () => UpdateProfileView()),
  ];
}
