import 'package:get/get.dart';
import 'package:coworking_space_mobile/features/home.dart';
import 'package:coworking_space_mobile/features/contact.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/views/screens/login.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/views/screens/register.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/screens/dashmin.dart';
import 'package:coworking_space_mobile/features/Client/presentation/views/screens/profile.dart';
import 'package:coworking_space_mobile/features/widgets/profile/update_profile_screen.dart';

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
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: contact, page: () => ContactScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: register, page: () => SignUpScreen()),
    GetPage(name: dashmin, page: () => DashminScreen()),
    GetPage(name: clientProfile, page: () => const ProfileScreen()),
    GetPage(name: updateProfile, page: () => const UpdateProfileScreen()),
  ];
}
