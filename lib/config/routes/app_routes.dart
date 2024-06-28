import 'package:coworking_space_mobile/features/Admin/presentation/views/screens/admin_profile.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/screens/admin_profile_update.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/screens/blogs.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/screens/users.dart';
import 'package:coworking_space_mobile/features/Client/presentation/views/screens/create_blog_view.dart';
import 'package:coworking_space_mobile/features/Client/presentation/views/screens/update_blog_view.dart';
import 'package:coworking_space_mobile/features/Client/presentation/views/screens/user_blogs_view.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/core/layout/main_layout.dart';
import 'package:coworking_space_mobile/features/home.dart';
import 'package:coworking_space_mobile/features/contact.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/views/screens/login.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/views/screens/register.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/screens/dashmin.dart';
import 'package:coworking_space_mobile/features/Client/presentation/views/screens/profile_view.dart';
import 'package:coworking_space_mobile/features/Client/presentation/views/screens/update_profile_view.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/views/screens/forgot_password.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/screens/equipements.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/screens/space.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/screens/categories.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/screens/services.dart';

class AppRoutes {
  static const String main = '/main';
  static const String home = '/home';
  static const String events = '/events';
  static const String about = '/about';
  static const String contact = '/contact';
  static const String clientProfile = '/profile';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassInstructions = "/reset-instructions";
  static const String dashmin = '/dashmin';
  static const String updateProfile = '/updateProfile';
  static const String equipements = '/equipements';
  static const String space = '/space';
  static const String categories = '/categories';
  static const String services = '/services';
  static const String adminProfile = '/adminProfile';
  static const String updateAdminProfile = '/update-admin-profile';
  static const String users = '/users';
  static const String blogs = '/blogs';
  static const String userBlogs = '/user-blogs';
  static const String createBlog = '/create-blog';
  static const String updateBlog = '/update-blog';
  static const String servicesScreen = '/services-screen';

  static final pages = [
    GetPage(name: main, page: () => const MainLayout(title: 'Coworking Space')),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: contact, page: () => const ContactScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: register, page: () => const SignUpScreen()),
    GetPage(name: forgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: resetPassInstructions, page: () => ResetPasswordInstructions()),
    GetPage(name: dashmin, page: () => DashminScreen()),
    GetPage(name: clientProfile, page: () => ProfileView()),
    GetPage(name: updateProfile, page: () => UpdateProfileView()),
    GetPage(name: equipements, page: () => EquipementsScreen()),
    GetPage(name: space, page: () => SpaceScreen()),
    GetPage(name: categories, page: () => CategoryScreen()),
    GetPage(name: services, page: () => ServiceScreen()),
    GetPage(name: adminProfile, page: () => AdminProfile()),
    GetPage(name: updateAdminProfile, page: () => AdminProfileUpdate()),
    GetPage(name: users, page: () => UsersScreen()),
    GetPage(name: blogs, page: () => BlogsScreen()),
    GetPage(name: userBlogs, page: () => UserBlogsView()),
    GetPage(name: createBlog, page: () => CreateBlogView(userId: Get.arguments as String)),
    GetPage(name: updateBlog, page: () => UpdateBlogScreen(blog: Get.arguments)),
  ];
}
