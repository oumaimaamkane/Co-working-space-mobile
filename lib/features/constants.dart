import 'package:flutter/material.dart';

class MainMenuData {
  final String name;
  final IconData icon;
  final String? route;
  final VoidCallback? onTap;

  MainMenuData({
    required this.name,
    required this.icon,
    this.route,
    this.onTap,
  });
}

List<MainMenuData> listMainMenu = [
  MainMenuData(name: 'Home', icon: Icons.home, route: '/home'),
  MainMenuData(name: 'Settings', icon: Icons.settings, route: '/settings'),
  // Add more menu items as needed
];

const tProfile = "Profile";
const tUpdateProfile = "Update Profile";
const tDefaultSize = 16.0;
const tProfileImage = 'assets/leyericon-1.png'; // Ensure the image path is correct
const tPrimaryColor = Colors.blue;
const tProfileHeading = "Your Name";
const tProfileSubHeading = "Your Title";
const tEditProfile = "Edit Profile";
const tDarkColor = Colors.black;

final buttonStyle = ElevatedButton.styleFrom(
  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
  foregroundColor: Colors.white,
);
