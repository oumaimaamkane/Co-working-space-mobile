import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showPersonIcon;
  final bool showBackArrow;

  const MyAppBar({
    required this.title,
    this.showPersonIcon = true,
    this.showBackArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left))
          : null,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [
        if (showPersonIcon && !showBackArrow)
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 62, 141, 130),
            ),
            onPressed: () async {
              // Check if the user is authenticated
              User? user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                // If authenticated, navigate to the profile screen
                Navigator.pushNamed(context, AppRoutes.clientProfile);
              } else {
                // If not authenticated, navigate to the login screen
                Navigator.pushNamed(context, AppRoutes.login);
              }
            },
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

