import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/core/layout/app_bar.dart';
import 'package:coworking_space_mobile/features/constants.dart';
import 'package:coworking_space_mobile/core/models/user_model.dart';
import 'package:coworking_space_mobile/features/Client/presentation/viewmodels/update_profile_viewmodel.dart';
import 'package:coworking_space_mobile/config/services/user_infos.dart'; // Import UserInfos service file
import 'package:coworking_space_mobile/config/routes/app_routes.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/viewmodels/login_viewmodel.dart';


class UpdateProfileView extends StatelessWidget {
  final UpdateProfileViewModel _viewModel = UpdateProfileViewModel();
  final UserInfos _userInfos = UserInfos();
  final LoginViewModel _loginViewModel = Get.find<LoginViewModel>(); // Get the LoginViewModel

  UpdateProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel userModel = Get.arguments as UserModel;
    TextEditingController nameController =
        TextEditingController(text: userModel.name);
    TextEditingController phoneController =
        TextEditingController(text: userModel.phone);

    return Scaffold(
      appBar: const MyAppBar(
        title: tUpdateProfile,
        showPersonIcon: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Get the userId using UserInfos
                String userId = _userInfos.getUserId();

                // Update the user's profile data in Firebase
                await _viewModel.updateProfile(
                  UserModel(
                    name: nameController.text,
                    email: userModel.email, // Use the existing email
                    password: userModel.password,
                    phone: phoneController.text,
                  ),
                  userId, // Pass the userId here
                );

                // Update the userName in LoginViewModel
                _loginViewModel.userName.value = nameController.text;

                // Navigate back to the ProfileView
                Get.offNamed(AppRoutes.clientProfile);
              },
              style: buttonStyle,
              child: const Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

