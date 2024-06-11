import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';


class SyncAuth {
  static const String serverUrl = 'http://127.0.0.1:8000/api';
  static bool isLoggedOut = false;

  static Future<void> syncUserToMySQL(String name, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$serverUrl/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        print('User synced to MySQL successfully');
      } else {
        print('Failed to sync user to MySQL: ${response.statusCode}');
      }
    } catch (e) {
      print('Error syncing user to MySQL: $e');
    }
  }

  Future<String> getUserRole(String userId) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      return userDoc['role'];
    } catch (e) {
      print('Failed to get user role: $e');
      throw e;
    }
  }

  bool isAuthenticated() {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null && !isLoggedOut;
  }

  static Future<bool> logout(BuildContext context) async {
  var result = await Get.defaultDialog(
    title: "Logout",
    middleText: "Are you sure you want to logout?",
    actions: [
      TextButton(
        onPressed: () {
          Get.back(result: false); // Dismiss the dialog with result = false
        },
        child: const Text("No"),
      ),
      TextButton(
        onPressed: () {
          Get.back(result: true); // Dismiss the dialog with result = true
        },
        child: const Text("Yes"),
      ),
    ],
  );

  if (result != null && result) {
    // Logout the user only if result is true (i.e., the user confirmed the logout)
    await FirebaseAuth.instance.signOut();
    isLoggedOut = true; // Update the isLoggedOut flag
    Get.offAllNamed(AppRoutes.login); // Navigate to the login screen
  }

  return result ?? false; // Return false if result is null
}





//   static Future<void> logout(BuildContext context) async {
//     print("Logout method called");
//   return Get.defaultDialog(
//     title: "Logout",
//     middleText: "Are you sure you want to logout?",
//     actions: [
//       TextButton(
//         onPressed: () async {
//           await FirebaseAuth.instance.signOut();
//           Get.offAllNamed(AppRoutes.main); // Navigate to main screen
//         },
//         child: const Text("Yes"),
//       ),
//       TextButton(
//         onPressed: () {
//           Get.back(); // Dismiss the dialog
//         },
//         child: const Text("No"),
//       ),
//     ],
//   );
// }


}


