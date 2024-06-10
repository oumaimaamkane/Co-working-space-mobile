import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:coworking_space_mobile/core/layout/app_bar.dart';
import 'package:coworking_space_mobile/features/home.dart';
import 'package:coworking_space_mobile/features/contact.dart';

class MainLayout extends StatefulWidget {
  final String title;

  const MainLayout({super.key, required this.title});

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: widget.title,
        showBackArrow: false,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: const Color.fromARGB(255, 49, 111, 103),
      unselectedItemColor: Colors.grey,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(LineAwesomeIcons.home),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(LineAwesomeIcons.envelope),
          label: 'Contact',
        ),
        BottomNavigationBarItem(
          icon: PopupMenuButton<String>(
            icon: const Icon(LineAwesomeIcons.bars),
            onSelected: (String result) {
              _onPopupMenuSelected(result);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'profile',
                child: Text('Profile'),
              ),
              const PopupMenuItem<String>(
                value: 'settings',
                child: Text('Settings'),
              ),
            ],
          ),
          label: 'More',
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPopupMenuSelected(String value) {
    switch (value) {
      case 'profile':
        // Navigator.pushNamed(context, AppRoutes.profile);
        break;
      case 'settings':
        // Navigator.pushNamed(context, AppRoutes.settings);
        break;
    }
  }
}
