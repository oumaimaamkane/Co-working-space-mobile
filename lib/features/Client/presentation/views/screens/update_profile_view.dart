import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/core/layout/app_bar.dart';
import 'package:coworking_space_mobile/features/constants.dart';
import 'package:coworking_space_mobile/core/models/user_model.dart';
import 'package:coworking_space_mobile/features/Client/presentation/viewmodels/update_profile_viewmodel.dart';

class UpdateProfileView extends StatelessWidget {
  final String? name;
  final String? phone;
  final UpdateProfileViewModel _viewModel = UpdateProfileViewModel();

  UpdateProfileView({Key? key, this.name, this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: name);
    TextEditingController phoneController = TextEditingController(text: phone);

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
                await _viewModel.updateProfile(
                  UserModel(
                    name: nameController.text,
                    email: 'email@example.com', // You can add email if needed
                    password: 'password', // You can add password if needed
                  ),
                );
                Navigator.of(context).pop(); // Navigate back to the previous screen
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
