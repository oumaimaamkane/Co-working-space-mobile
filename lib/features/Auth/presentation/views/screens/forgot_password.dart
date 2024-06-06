import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/viewmodels/forgot_password_viewmodel.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordViewModel>(
      init: ForgotPasswordViewModel(), // Initialize the view model
      builder: (viewModel) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.white,
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 82, 197, 181)),
        ),
        body: Form(
          key: viewModel.formKey,
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _Header(),
                const SizedBox(height: 20),
                _InputField(viewModel),
                const SizedBox(height: 20),
                SizedBox(  // Added SizedBox to enforce button width
                  width: double.infinity,  // Force button to take full width
                  child: ElevatedButton(
                    onPressed: () {
                      if (viewModel.formKey.currentState!.validate()) {
                        viewModel.resetPassword(context);
                        Get.toNamed(AppRoutes.resetPassInstructions);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      "Reset Password",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Forgot Password",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text("Enter your email to receive a password reset link"),
      ],
    );
  }
}

class _InputField extends StatelessWidget {
  final ForgotPasswordViewModel viewModel;

  const _InputField(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: viewModel.emailController,
      decoration: InputDecoration(
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.teal.withOpacity(0.1),
        filled: true,
        prefixIcon: const Icon(Icons.email),
      ),
      validator: (value) {
        if (value == null || value.isEmpty || !EmailValidator.validate(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }
}

class ResetPasswordInstructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 82, 197, 181)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "An email has been sent to your email address with instructions on how to reset your password.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // Add space between text and button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add horizontal padding
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Back to Login"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

