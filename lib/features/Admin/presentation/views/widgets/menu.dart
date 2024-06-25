import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/dashmin_viewmodel.dart';

class Menu extends StatelessWidget {
  final DashminViewModel viewModel;

  const Menu({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => viewModel.navigateTo(context, AppRoutes.main),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Icon(
                Icons.add_to_drive,
                size: 64,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ...ListTile.divideTiles(
                  context: context,
                  tiles: [
                    ListTile(
                      leading: const Icon(Icons.home),
                      title: const Text('Home'),
                      onTap: () => viewModel.navigateTo(context, AppRoutes.main),
                    ),
                    ListTile(
                      leading: const Icon(Icons.dashboard),
                      title: const Text('Dashboard'),
                      onTap: () => viewModel.navigateTo(context, AppRoutes.dashmin),
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                      onTap: () {
                        // Add your settings logic here
                      },
                    ),
                     ListTile(
                      leading: const Icon(Icons.space_dashboard),
                      title: const Text('Space'), 
                      onTap: () => viewModel.navigateTo(context, AppRoutes.space),
                    ),
                    ListTile(
                      leading: const Icon(Icons.design_services),
                      title: const Text('Services'), 
                      onTap: () => viewModel.navigateTo(context, AppRoutes.services),
                    ),
                    ListTile(
                      leading: const Icon(Icons.category),
                      title: const Text('Categories'), 
                      onTap: () => viewModel.navigateTo(context, AppRoutes.categories),
                    ),
                    ListTile(
                      leading: const Icon(Icons.devices),
                      title: const Text('Equipements'),
                      onTap: () => viewModel.navigateTo(context, AppRoutes.equipements),
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Logout'),
                      onTap: () => viewModel.logout(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
