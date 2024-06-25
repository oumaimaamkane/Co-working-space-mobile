import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/core/layout/app_bar.dart';
import 'package:coworking_space_mobile/features/constants.dart';
import 'package:coworking_space_mobile/core/models/user_model.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/admin_profile_update_viewmodel.dart';
import 'package:coworking_space_mobile/config/services/user_infos.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/viewmodels/login_viewmodel.dart';

class AdminProfileUpdate extends StatelessWidget {
  final AdminProfileUpdateViewModel _viewModel = AdminProfileUpdateViewModel();
  final UserInfos _userInfos = UserInfos();
  final LoginViewModel _loginViewModel = Get.find<LoginViewModel>();

  AdminProfileUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel userModel = Get.arguments as UserModel;
    TextEditingController nameController = TextEditingController(text: userModel.name);
    TextEditingController phoneController = TextEditingController(text: userModel.phone);

    return Scaffold(
      appBar: const MyAppBar(
        title: 'Update Admin Profile',
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
                String userId = _userInfos.getUserId();

                await _viewModel.updateProfile(
                  UserModel(
                    name: nameController.text,
                    email: userModel.email,
                    password: userModel.password,
                    role: userModel.role,
                    phone: phoneController.text,
                  ),
                  userId,
                );

                _loginViewModel.userName.value = nameController.text;

                Get.offNamed(AppRoutes.adminProfile);
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
