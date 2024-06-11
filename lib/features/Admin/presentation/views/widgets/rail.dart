import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/constants.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/dashmin_viewmodel.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';

class Rail extends StatefulWidget {
  final DashminViewModel viewModel;
  const Rail({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<Rail> createState() => _RailState();
}

class _RailState extends State<Rail> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context);
    List<NavigationRailDestination> listRails = [];
    for (var i = 0; i < listMainMenu.length; i++) {
      var element = listMainMenu[i];
      if (route!.settings.name == element.route) {
        selectedIndex = i;
      }
      listRails.add(NavigationRailDestination(
        label: Text(element.name),
        icon: Icon(element.icon),
        selectedIcon: Icon(
          element.icon,
          color: Colors.indigoAccent,
        ),
      ));
    }

    // Add the logout destination
    listRails.add(const NavigationRailDestination(
      icon: Icon(Icons.logout),
      label: Text('Logout'),
    ));

    return Material(
      child: SingleChildScrollView(
        primary: false,
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: IntrinsicHeight(
            child: Column(
              children: [
                Expanded(
                  child: NavigationRail(
                    selectedIndex: selectedIndex,
                    leading: InkWell(
                      onTap: () => widget.viewModel.navigateTo(context, AppRoutes.main),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: Icon(
                          Icons.add_to_drive,
                          size: 32,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    onDestinationSelected: (value) {
  setState(() {
    selectedIndex = value;
  });
  if (value == listRails.length - 1) {
    // Logout tapped
    widget.viewModel.logout(context);
  } else {
    var route = listMainMenu[value].route;
    if (route != null) {
      if (route == AppRoutes.main) {
        // Navigate to MainLayout instead of directly to HomeScreen
        widget.viewModel.navigateTo(context, AppRoutes.main);
      } else {
        widget.viewModel.navigateTo(context, route);
      }
    } else {
      print('Route is null for the selected destination.');
    }
  }
},



                    destinations: listRails,
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
