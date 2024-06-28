import 'package:coworking_space_mobile/core/models/user_model.dart';
import 'package:coworking_space_mobile/features/Auth/presentation/viewmodels/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:coworking_space_mobile/features/constants.dart';
import 'package:coworking_space_mobile/features/widgets/profile_menu.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';
import 'package:coworking_space_mobile/core/layout/app_bar.dart';
import 'package:coworking_space_mobile/features/Client/presentation/viewmodels/profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  final ProfileViewModel viewModel = Get.put(ProfileViewModel());
  final LoginViewModel loginViewModel = Get.find<LoginViewModel>();

  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: const MyAppBar(
        title: tProfile,
        showPersonIcon: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage(tProfileImage)),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: tPrimaryColor,
                      ),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Obx(() => Text(
                    loginViewModel.userName.value.isNotEmpty
                        ? loginViewModel.userName.value
                        : tProfileHeading,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  )),
              Text(
                loginViewModel.userMail.value.isNotEmpty
                    ? loginViewModel.userMail.value
                    : tProfileSubHeading,
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    var arguments = UserModel(
                      name: loginViewModel.userName.value,
                      email: loginViewModel.userMail.value,
                      password: '',
                      role: 'user',
                      phone: loginViewModel.userPhone.value,
                    );
                    Get.toNamed(AppRoutes.updateProfile, arguments: arguments);
                  },
                  style: buttonStyle,
                  child: const Text(
                    tEditProfile,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: "Settings",
                icon: LineAwesomeIcons.cog,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Billing Details",
                icon: LineAwesomeIcons.wallet,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "My Bookings",
                icon: LineAwesomeIcons.calendar_check,
                onPress: () {
                  // Navigation or logic for "My Bookings"
                },
              ),
              ProfileMenuWidget(
                title: "My Blogs",
                icon: LineAwesomeIcons.pen,
                onPress: () {
                  Get.toNamed(AppRoutes.userBlogs, arguments: loginViewModel.userId.value);
                },
              ),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: "Information",
                icon: LineAwesomeIcons.info,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Logout",
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {
                  viewModel.logout(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
