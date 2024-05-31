import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';

class LoginViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passController.text,
        );

        String userId = userCredential.user!.uid;

        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
        String role = userDoc['role'];

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

  void dispose() {
    emailController.dispose();
    passController.dispose();
  }
}
