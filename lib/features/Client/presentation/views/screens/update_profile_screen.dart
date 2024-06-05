import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:coworking_space_mobile/core/layout/app_bar.dart';
import 'package:coworking_space_mobile/features/constants.dart';


class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      // appBar: const MyAppBar(
      //   title: 'Update Profile',
      //   showPersonIcon: false,
      // ),
      appBar: const MyAppBar(
        title: tUpdateProfile,
        showPersonIcon: false, // Don't show the person icon
      ),
      body: Padding(
        padding:  const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const SizedBox(height: 20),
             const TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
             const SizedBox(height: 20),
             const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
             const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add update profile functionality
              },
              child: const Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
