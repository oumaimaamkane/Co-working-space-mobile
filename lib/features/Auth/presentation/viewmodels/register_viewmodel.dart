import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space_mobile/config/services/sync_auth.dart';
import 'package:coworking_space_mobile/core/models/user_model.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';
import 'package:get/get.dart';

class SignUpViewModel extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController repassController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> register(BuildContext context) async {
    _isLoading = true;
    update();

    try {
      String name = nameController.text;
      String email = emailController.text;
      String password = passController.text;

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.updateDisplayName(name);

      String userId = userCredential.user!.uid;
      UserModel user = UserModel(
        name: name,
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set(user.toMap());

      await SyncAuth.syncUserToMySQL(name, email, password);

      Navigator.pushReplacementNamed(context, AppRoutes.login);
    } catch (e) {
      print('Failed to register user: $e');
      // Handle registration errors or display error message
    } finally {
      _isLoading = false;
      update();
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    repassController.dispose();
    super.onClose();
  }
}
