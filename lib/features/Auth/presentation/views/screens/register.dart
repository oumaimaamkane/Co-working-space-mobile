import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/viewmodels/register_viewmodel.dart';
import 'package:coworking_space_mobile/features/widgets/preloader_dots.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpViewModel>(
      init: SignUpViewModel(),
      builder: (viewModel) {
        return Scaffold(
          appBar: viewModel.isLoading
              ? null
              : AppBar(
                  leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
                  backgroundColor: Colors.white,
                  iconTheme: const IconThemeData(color: Color.fromARGB(255, 82, 197, 181)),
                  // leading: IconButton(
                  //   icon: const Icon(Icons.arrow_back),
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  // ),
                ),
          backgroundColor: Colors.white,
          body: viewModel.isLoading
              ? Container(
                  color: const Color.fromARGB(255, 90, 90, 90),
                  child: const Center(child: BouncingPreloader()),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Image.asset(
                          "images/vector-2.png",
                          width: 428,
                          height: 457,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          textDirection: TextDirection.ltr,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Sign up',
                              style: TextStyle(
                                color: Color.fromARGB(255, 82, 197, 181),
                                fontSize: 27,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              height: 56,
                              child: TextField(
                                controller: viewModel.nameController,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF393939),
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 82, 197, 181),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 63, 126, 118),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 82, 197, 181),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 17),
                            SizedBox(
                              height: 56,
                              child: TextField(
                                controller: viewModel.emailController,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF393939),
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 82, 197, 181),
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 63, 126, 118),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 82, 197, 181),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 17),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 147,
                                  height: 56,
                                  child: TextField(
                                    controller: viewModel.passController,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFF393939),
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: const InputDecoration(
                                      labelText: 'Password',
                                      hintText: 'Create Password',
                                      hintStyle: TextStyle(
                                        color: Color.fromARGB(255, 63, 126, 118),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 82, 197, 181),
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color.fromARGB(255, 63, 126, 118),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color.fromARGB(255, 82, 197, 181),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 147,
                                  height: 56,
                                  child: TextField(
                                    controller: viewModel.repassController,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFF393939),
                                      fontSize: 13,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    decoration: const InputDecoration(
                                      labelText: 'Confirm Password',
                                      hintText: 'Confirm Password',
                                      hintStyle: TextStyle(
                                        color: Color.fromARGB(255, 63, 126, 118),
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      labelStyle: TextStyle(
                                        color: Color.fromARGB(255, 82, 197, 181),
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color.fromARGB(255, 63, 126, 118),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color.fromARGB(255, 82, 197, 181),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 48),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 137,
                                height: 47,
                                child: ElevatedButton(
                                  onPressed: () {
                                    viewModel.register(context);
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.resolveWith<Color>(
                                      (Set<WidgetState> states) {
                                        if (states
                                            .contains(WidgetState.disabled)) {
                                          return Colors.grey; // Disabled color
                                        }
                                        return const Color.fromARGB(
                                            255, 82, 197, 181); // Enabled color
                                      },
                                    ),
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
