import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/users_viewmodel.dart';
import 'package:coworking_space_mobile/core/models/user_model.dart';
import 'package:coworking_space_mobile/core/layout/dash_layout.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/headline.dart';

class UsersScreen extends StatelessWidget {
  final UsersViewModel viewModel = Get.put(UsersViewModel());

  @override
  Widget build(BuildContext context) {
    return DashLayout(
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Headline(
                  title: "Users",
                  caption: "Management of users",
                ),
                const SizedBox(height: 32),
                Obx(() => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: viewModel.users.length,
                      itemBuilder: (context, index) {
                        UserModel user = viewModel.users[index];
                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: const Icon(Icons.person), // Add an icon or any leading widget here
                            title: Text(user.name),
                            subtitle: Text(user.email),
                            trailing: IconButton(
                              icon: const Icon(Icons.block),
                              onPressed: () => viewModel.banUser(user),
                            ),
                          ),
                        );
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
