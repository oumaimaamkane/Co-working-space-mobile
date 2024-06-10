import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/features/constants.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';
import 'package:coworking_space_mobile/config/services/sync_auth.dart';

// Define the AppColors class
class AppColors {
  static const Color indigoAccent = Colors.indigoAccent;
  static const Color grey800 = Colors.grey;
  static const Color grey400 = Colors.grey;
}

// Define the AppBaseData class
class AppBaseData {
  static const String version = '1.0.0';
  static const String author = 'John Doe';
}


class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.main);
            },
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
                      onTap: () {
                        Get.toNamed(AppRoutes.main);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                      onTap: () {
                        // Add your settings logic here
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('Logout'),
                      onTap: () async {
                        Navigator.pop(context); // Close the drawer
                        await SyncAuth.logout(context);
                      },
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

// class Menu extends StatelessWidget {
//   const Menu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var route = ModalRoute.of(context);
//     List<MainMenuData> listMainMenu = [
//       MainMenuData(name: 'Home', icon: Icons.home, route: AppRoutes.main),
//       MainMenuData(name: 'Settings', icon: Icons.settings, route: '/settings'),
//       MainMenuData(
//         name: 'Logout',
//         icon: Icons.logout,
//         onTap: () async {
//           Get.back();
//           await SyncAuth.logout();
//           // Clear user data if needed
//           Get.offAllNamed(AppRoutes.login); // Clear stack and navigate to login
//         },
//       ),
//     ];

//     return Drawer(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           InkWell(
//             onTap: () {
//               Get.toNamed(AppRoutes.main);
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(32),
//               child: Icon(
//                 Icons.add_to_drive,
//                 size: 64,
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: listMainMenu.length,
//               itemBuilder: (context, index) {
//                 MainMenuData menu = listMainMenu[index];
//                 return ListTile(
//                   selected: route!.settings.name == menu.route,
//                   selectedTileColor: AppColors.indigoAccent.withOpacity(0.3),
//                   onTap: () {
//                     if (menu.route != null) {
//                       Get.offAllNamed(menu.route!);
//                     } else {
//                       // Check authentication before navigating to dashmin
//                       if (SyncAuth().isAuthenticated()) {
//                         Get.offAllNamed(AppRoutes.dashmin);
//                       } else {
//                         Get.offAllNamed(AppRoutes.login);
//                       }
//                     }
//                   },
//                   title: Text(menu.name),
//                   leading: Icon(menu.icon),
//                   selectedColor: Colors.white,
//                 );
//               },
//             ),
//           ),
//           const Align(
//             alignment: Alignment.bottomCenter,
//             child: Column(
//               children: [
//                 Text.rich(
//                   TextSpan(
//                     text: 'Version: ',
//                     style: TextStyle(
//                       fontSize: 10,
//                       color: AppColors.grey800,
//                     ),
//                     children: <InlineSpan>[
//                       TextSpan(
//                         text: AppBaseData.version,
//                         style: TextStyle(
//                           color: AppColors.grey400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 3,
//                 ),
//                 Text.rich(
//                   TextSpan(
//                     text: 'Author: ',
//                     style: TextStyle(
//                       fontSize: 10,
//                       color: AppColors.grey800,
//                     ),
//                     children: <InlineSpan>[
//                       TextSpan(
//                         text: AppBaseData.author,
//                         style: TextStyle(
//                           fontSize: 10,
//                           color: AppColors.grey400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }