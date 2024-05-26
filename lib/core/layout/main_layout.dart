import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/home.dart';
import 'package:coworking_space_mobile/features/contact.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';

class MainLayout extends StatefulWidget {
  final String title;

  const MainLayout({
    required this.title,
  });

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: _screens[_selectedIndex], // Use the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromARGB(255, 49, 111, 103),
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('LOGO'),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.person,
            color: Color.fromARGB(255, 62, 141, 130),
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.login);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
