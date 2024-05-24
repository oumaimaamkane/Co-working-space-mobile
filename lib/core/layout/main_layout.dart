import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';

class MainLayout extends StatefulWidget {
  final String title;
  final Widget child;

  const MainLayout({
    required this.title,
    required this.child,
  });

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Handle navigation based on the selected index
    switch (index) {
      case 0:
        Navigator.pushNamed(context, AppRoutes.home);
        break;
      case 1:
        Navigator.pushNamed(context, AppRoutes.events);
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.about);
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.contact);
        break;
      case 4:
        Navigator.pushNamed(context, AppRoutes.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: widget.child,
      bottomNavigationBar: BottomAppBar(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate the total width of all items
            double totalWidth = constraints.maxWidth;
            double itemWidth = (totalWidth - 32) /
                4; // Assuming you want 4 items and 32 as the total space between items

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 8), // Add initial space
                  _buildBottomNavigationBarItem(
                      Icons.home, 'Home', 0, itemWidth),
                  const SizedBox(width: 8), // Add space between items
                  _buildBottomNavigationBarItem(
                      Icons.event, 'Events', 1, itemWidth),
                  const SizedBox(width: 8), // Add space between items
                  _buildBottomNavigationBarItem(
                      Icons.info, 'About', 2, itemWidth),
                  const SizedBox(width: 8), // Add space between items
                  _buildBottomNavigationBarItem(
                      Icons.contact_mail, 'Contact', 3, itemWidth),
                  const SizedBox(width: 8), // Add space between items
                  _buildBottomNavigationBarItem(
                      Icons.person, 'Profile', 4, itemWidth),
                  const SizedBox(width: 8), // Add space between items
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBarItem(
      IconData icon, String label, int index, double width) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: SizedBox(
        width: width,
        child: Container(
          padding: EdgeInsets.only(
              top: _currentIndex == index
                  ? 5
                  : 0), // Add padding only to the top if the item is selected
          decoration: BoxDecoration(
            border: _currentIndex == index
                ? const Border(
                    top: BorderSide(
                      color: Color.fromARGB(255, 85, 187, 174),
                      width: 3,
                    ),
                  )
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                color: _currentIndex == index
                    ? const Color.fromARGB(255, 85, 187, 174)
                    : Colors.grey,
              ),
              Text(
                label,
                style: TextStyle(
                  color: _currentIndex == index
                      ? const Color.fromARGB(255, 85, 187, 174)
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('LOGO'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
