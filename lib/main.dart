import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/equipements_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';
import 'package:coworking_space_mobile/core/layout/main_layout.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/viewmodels/login_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize LoginViewModel
  Get.put(LoginViewModel());
  // Get.put(EquipementViewModel());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      initialRoute: AppRoutes.main,
      getPages: AppRoutes.pages,
      home: const MainLayout(title: 'Coworking Space'),
  //     navigatorObservers: [
  //   RouteObserver(
  //     onBeforeNavigate: (Route route, dynamic data) {
  //       if (route.settings.name == AppRoutes.equipements &&
  //           !Get.find<EquipementViewModel>()._equipementsStream.hasValue) {
  //         Get.snackbar(
  //           "Error",
  //           "Equipements are not loaded yet",
  //           snackPosition: SnackPosition.BOTTOM,
  //         );
  //         return false; // Prevent navigation
  //       }
  //       return true; // Allow navigation
  //     },
  //   ),
  // ],
    );
  }
}

