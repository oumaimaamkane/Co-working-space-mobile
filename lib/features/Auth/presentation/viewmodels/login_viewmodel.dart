import 'package:coworking_space_mobile/features/Auth/presentation/viewmodels/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space_mobile/config/services/sync_auth.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';
import 'package:coworking_space_mobile/config/services/user_infos.dart';

class LoginViewModel extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var userName = ''.obs;
  var userMail = ''.obs;
  var userPhone = ''.obs;
  var userId = ''.obs;

  final UserInfos _userService = UserInfos();

  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );

        String userId = userCredential.user!.uid;
        this.userId.value = userId; // Ensure this is set correctly
        String role = await SyncAuth().getUserRole(userId);

        // Fetch the user data
        DocumentSnapshot userData = await _userService.getUserData(userId);
        bool isBanned = userData['isBanned'] ?? false; // Check if user is banned

        if (isBanned) {
          // User is banned, prevent login
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('You are banned. Contact support for more information.')));
          return;
        }

        userName.value = userData['name'] ?? '';
        userMail.value = userData['email'] ?? '';
        userPhone.value = userData['phone'] ?? '';

        if (role == 'admin') {
          Get.offNamed(AppRoutes.dashmin);
        } else if (role == 'user') {
          Get.offNamed(AppRoutes.clientProfile);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Unknown role')));
        }
      } catch (e) {
        print('Failed to login: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to login: $e')));
      }
    }
  }

  Future<void> signInWithGoogle() async {
    SignUpViewModel registerViewModel = SignUpViewModel();
    await registerViewModel.signInWithGoogle();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}
