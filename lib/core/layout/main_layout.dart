import 'package:flutter/material.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isMenuOpen = false;

  void _toggleMenu() {
    if (isMenuOpen) {
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      _scaffoldKey.currentState?.openDrawer();
    }
  }

  void _handleDrawerChanged(bool isOpened) {
    setState(() {
      isMenuOpen = isOpened;
    });
  }

  Widget _buildMenuItem(String title, {VoidCallback? onTap, bool hasSubItems = false}) {
    return HoverableListTile(
      title: title,
      onTap: onTap,
      hasSubItems: hasSubItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(
        isMenuOpen: isMenuOpen,
        toggleMenu: _toggleMenu,
      ),
      drawer: Drawer(
        // Corrected placement of the Drawer widget
        child: Container(
          color: const Color(0xFF353535),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                child: Text('Drawer Header'),
              ),
              _buildMenuItem('Home', onTap: () {
                Navigator.pop(context);
              }),
              _buildMenuItem('Events', hasSubItems: true, onTap: () {
                Navigator.pop(context);
              }),
              _buildMenuItem('Plans', onTap: () {
                Navigator.pop(context);
              }),
              _buildMenuItem('About', onTap: () {
                Navigator.pop(context);
              }),
              _buildMenuItem('Contact', onTap: () {
                Navigator.pop(context);
              }),
            ],
          ),
        ),
      ),
      onDrawerChanged: _handleDrawerChanged,
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          // Handle bottom navigation bar tap
        },
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isMenuOpen;
  final VoidCallback toggleMenu;

  const MyAppBar({
    Key? key,
    required this.isMenuOpen,
    required this.toggleMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('My App Bar'),
      actions: [
        IconButton(
          icon: isMenuOpen ? const Icon(Icons.close) : const Icon(Icons.menu),
          color: isMenuOpen ? const Color(0xFF55BBAF) : Colors.white,
          onPressed: toggleMenu,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class HoverableListTile extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;
  final bool hasSubItems;

  const HoverableListTile({
    Key? key,
    required this.title,
    this.onTap,
    this.hasSubItems = false,
  }) : super(key: key);

  @override
  _HoverableListTileState createState() => _HoverableListTileState();
}

class _HoverableListTileState extends State<HoverableListTile> {
  bool _isHovered = false;

  void _onEnter(PointerEvent details) {
    setState(() {
      _isHovered = true;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: Container(
        color: _isHovered ? Colors.grey[800] : Colors.transparent, // Darker color on hover
        child: ListTile(
          title: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white, // White text color
                    fontWeight: FontWeight.bold, // Bold font weight
                    fontSize: 16.0, // Font size
                  ),
                ),
              ),
              if (widget.hasSubItems)
                Container(
                  margin: const EdgeInsets.only(left: 8.0), // Margin between title and arrow
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[700]!, width: 1.0), // Solid grey border
                    borderRadius: BorderRadius.circular(4.0),
                    color: const Color(0xFF353535), // Darker background color
                  ),
                  child: const Icon(
                    Icons.arrow_right,
                    color: Colors.white, // White arrow icon
                  ),
                ),
            ],
          ),
          onTap: widget.onTap,
          tileColor: Colors.transparent,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0), // Align text to the left
        ),
      ),
    );
  }
}
