import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/viewmodels/login_viewmodel.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginViewModel>(
      init: LoginViewModel(),
      builder: (viewModel) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.offAllNamed(AppRoutes.main);
            },
            icon: const Icon(LineAwesomeIcons.angle_left),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color.fromARGB(255, 82, 197, 181)),
        ),
        body: Form(
          key: viewModel.formKey,
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const _Header(),
                _InputField(viewModel),
                _forgotPassword(context),
                _signup(context, viewModel),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.toNamed(AppRoutes.forgotPassword);
      },
      child: const Text(
        "Forgot password?",
        style: TextStyle(color: Colors.teal),
      ),
    );
  }

  Widget _signup(BuildContext context, LoginViewModel viewModel) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don’t have an account? "),
            TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.register);
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(color: Colors.teal),
              ),
            ),
          ],
        ),
      ],
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
          "Welcome Back",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Enter your credentials to login"),
      ],
    );
  }
}

class _InputField extends StatelessWidget {
  final LoginViewModel viewModel;

  const _InputField(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
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
            if (value == null ||
                value.isEmpty ||
                !EmailValidator.validate(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: viewModel.passController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.teal.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.lock),
          ),
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters long';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            if (viewModel.formKey.currentState!.validate()) {
              viewModel.login(context);
            }
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            foregroundColor: Colors.white,
          ),
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: 15),
        const Center(child: Text("Or")),
        const SizedBox(height: 15),
        Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.teal,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: TextButton(
            onPressed:
                viewModel.signInWithGoogle, // Call signInWithGoogle method
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: const BoxDecoration(
                    // image: DecorationImage(
                    //     image:
                    //         AssetImage('assets/images/login_signup/google.png'),
                    //     fit: BoxFit.cover),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 18),
                const Text(
                  "Sign In with Google",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
