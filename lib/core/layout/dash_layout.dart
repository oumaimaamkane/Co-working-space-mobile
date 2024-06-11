// lib/features/Admin/presentation/views/layouts/dash_layout.dart
import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/dashmin_viewmodel.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/menu.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/rail.dart';

class DashLayout extends StatelessWidget {
  final DashminViewModel viewModel = DashminViewModel();
  final Widget body;

  DashLayout({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Display Menu as a drawer for mobile devices
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Dashboard',
                style: TextStyle(color: Colors.white),
              ),
              leading: Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
            ),
            drawer: Menu(viewModel: viewModel),
            body: body,
          );
        } else {
          // Display Rail for tablet and larger screens
          return Scaffold(
            body: Row(
              children: [
                Rail(viewModel: viewModel),
                Expanded(
                  child: body,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
