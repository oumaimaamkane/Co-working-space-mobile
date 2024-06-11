import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';
import 'package:coworking_space_mobile/config/services/sync_auth.dart';

class DashminViewModel {
  // Method to get dashboard data
  Future<List<String>> getDashboardData() async {
    // Simulate a network request or data fetching
    await Future.delayed(const Duration(seconds: 2));
    return List<String>.generate(12, (index) => "Item $index");
  }

  // Method to handle navigation
  void navigateTo(BuildContext context, String route) {
    Get.toNamed(route);
  }

  // Method to handle logout
  Future<void> logout(BuildContext context) async {
    var result = await SyncAuth.logout(context);
    if (result != null && result) {
      Get.offAllNamed(AppRoutes.login); // Redirect to login screen after logout
    }
  }
}
