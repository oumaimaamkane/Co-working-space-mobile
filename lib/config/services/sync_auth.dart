import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';


class SyncAuth {
  static const String serverUrl = 'http://127.0.0.1:8000/api';

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
    // Check if the user is authenticated (e.g., check if FirebaseAuth.instance.currentUser is not null)
    User? user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  // static Future<void> logout(BuildContext context) async {
  //   await Get.dialog(
  //     AlertDialog(
  //       title: const Text('Logout'),
  //       content: const Text('Are you sure you want to logout?'),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             Get.back(); // Close the dialog
  //           },
  //           child: const Text('Cancel'),
  //         ),
  //         TextButton(
  //           onPressed: () async {
  //             // Perform the logout logic here
  //             Get.back(); // Close the dialog
  //             Get.offAllNamed('/main'); // Redirect to main screen
  //           },
  //           child: const Text('Logout'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  static Future<void> logout(BuildContext context) async {
    print("Logout method called");
  return Get.defaultDialog(
    title: "Logout",
    middleText: "Are you sure you want to logout?",
    actions: [
      TextButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Get.offAllNamed(AppRoutes.main); // Navigate to main screen
        },
        child: const Text("Yes"),
      ),
      TextButton(
        onPressed: () {
          Get.back(); // Dismiss the dialog
        },
        child: const Text("No"),
      ),
    ],
  );
}


}


