import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';

class ForgotPasswordViewModel extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  Future<void> resetPassword(BuildContext context) async {
    String email = emailController.text;
    // Implement logic to send password reset email
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
