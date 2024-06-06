import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/viewmodels/register_viewmodel.dart';
import 'package:coworking_space_mobile/features/widgets/preloader_dots.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpViewModel>(
      init: SignUpViewModel(),
      builder: (viewModel) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: viewModel.isLoading
                ? null
                : AppBar(
                    leading: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(LineAwesomeIcons.angle_left)),
                    backgroundColor: Colors.white,
                    iconTheme: const IconThemeData(
                        color: Color.fromARGB(255, 82, 197, 181)),
                  ),
            body: viewModel.isLoading
                ? Container(
                    color: const Color.fromARGB(255, 90, 90, 90),
                    child: const Center(child: BouncingPreloader()),
                  )
                : SingleChildScrollView(
                    child: Form(
                      key: viewModel
                          .formKey, // Add form key to access the form state
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        height: MediaQuery.of(context).size.height - 50,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                const SizedBox(height: 60.0),
                                const Text(
                                  "Sign up",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Create your account",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: viewModel.nameController,
                                  decoration: InputDecoration(
                                    hintText: "Username",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: BorderSide.none,
                                    ),
                                    fillColor: Colors.teal.withOpacity(0.1),
                                    filled: true,
                                    prefixIcon: const Icon(Icons.person),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
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
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
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
                                    prefixIcon: const Icon(Icons.password),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a password';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: viewModel.repassController,
                                  decoration: InputDecoration(
                                    hintText: "Confirm Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      borderSide: BorderSide.none,
                                    ),
                                    fillColor: Colors.teal.withOpacity(0.1),
                                    filled: true,
                                    prefixIcon: const Icon(Icons.password),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please confirm your password';
                                    }
                                    if (value !=
                                        viewModel.passController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 3, left: 3),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (viewModel.formKey.currentState != null &&
                                      viewModel.formKey.currentState!
                                          .validate()) {
                                    viewModel.register(context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder(),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  backgroundColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            const Center(child: Text("Or")),
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
                                    offset: const Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/login_signup/google.png'),
                                            fit: BoxFit.cover),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text("Already have an account?"),
                                TextButton(
                                  onPressed: () {
                                    Get.back(); // Add appropriate navigation
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(color: Colors.teal),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
