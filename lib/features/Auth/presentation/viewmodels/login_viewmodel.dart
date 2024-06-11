import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space_mobile/config/services/sync_auth.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/viewmodels/register_viewmodel.dart';
import 'package:coworking_space_mobile/config/services/user_infos.dart';

class LoginViewModel extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var userName = ''.obs;
  var userMail = ''.obs;
  var userPhone = ''.obs;

  final UserInfos _userService = UserInfos();

  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );

        String userId = userCredential.user!.uid;
        String role = await SyncAuth().getUserRole(userId);

        // Fetch the user data
        DocumentSnapshot userData = await _userService.getUserData(userId);
        userName.value = userData['name'] ?? '';
        userMail.value = userData['email'] ?? '';
        userPhone.value = userData['phone'] ?? '';


        if (role == 'admin') {
          Navigator.pushReplacementNamed(context, AppRoutes.dashmin);
        } else if (role == 'user') {
          Navigator.pushReplacementNamed(context, AppRoutes.clientProfile);
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

