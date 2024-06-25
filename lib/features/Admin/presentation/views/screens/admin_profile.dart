import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:coworking_space_mobile/features/constants.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';
import 'package:coworking_space_mobile/core/layout/dash_layout.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/admin_profile_viewmodel.dart';
import 'package:coworking_space_mobile/core/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminProfile extends StatelessWidget {
  final AdminProfileViewModel viewModel = AdminProfileViewModel();

  AdminProfile({Key? key}) : super(key: key);

  Future<UserModel?> fetchAdminUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get();
      if (userDoc.exists) {
        return UserModel(
          name: userDoc['name'],
          email: userDoc['email'],
          password: 'hidden', // Password should not be fetched
          role: userDoc['role'],
          phone: userDoc['phone'],
        );
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return DashLayout(
      body: Scaffold(
        body: FutureBuilder<UserModel?>(
          future: fetchAdminUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error fetching user data'));
            } else if (!snapshot.hasData) {
              return Center(child: Text('User data not found'));
            }

            UserModel userModel = snapshot.data!;

            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(tDefaultSize),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: const Image(image: AssetImage(tProfileImage)),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: tPrimaryColor,
                            ),
                            child: const Icon(
                              LineAwesomeIcons.alternate_pencil,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userModel.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      userModel.email,
                      style: TextStyle(
                        fontSize: 16,
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.updateProfile, arguments: userModel);
                        },
                        style: buttonStyle,
                        child: const Text("Edit Profile"),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: const Icon(LineAwesomeIcons.cog),
                      title: const Text("Settings"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(LineAwesomeIcons.wallet),
                      title: const Text("Billing Details"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(LineAwesomeIcons.user_check),
                      title: const Text("User Management"),
                      onTap: () {},
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: const Icon(LineAwesomeIcons.info),
                      title: const Text("Information"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(LineAwesomeIcons.alternate_sign_out),
                      title: const Text("Logout"),
                      textColor: Colors.red,
                      onTap: () {
                        viewModel.logout(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
