import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ProfileViewModel {
  void logout() {
    Get.defaultDialog(
      title: "LOGOUT",
      titleStyle: const TextStyle(fontSize: 20),
      content: const Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Text("Are you sure you want to logout?"),
      ),
      confirm: ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Get.back(); // Go back from confirmation dialog
          Get.back(); // Go back to MainLayout
        },
        child: const Text("Yes"),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: const Text("No"),
      ),
    );
  }
}
