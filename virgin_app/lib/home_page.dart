import 'package:flutter/material.dart';
import 'package:virgin_app/badges_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Home Page Content')),
    Center(child: Text('Add Friends')),
    Center(child: Text('Menu')),
    Center(child: Text('Community')),
    BadgesPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.red,
        clipBehavior: Clip.antiAlias,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.person_add, color: Colors.white), // Aggiunta amici
              onPressed: () => _onItemTapped(1),
            ),
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white), // Menu
              onPressed: () => _onItemTapped(2),
            ),
            SizedBox(width: 50), // Spazio per il FloatingActionButton
            IconButton(
              icon: Icon(Icons.groups, color: Colors.white), // Community
              onPressed: () => _onItemTapped(3),
            ),
            IconButton(
              icon: Icon(Icons.military_tech, color: Colors.white), // Medaglia
              onPressed: () => _onItemTapped(4),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => _onItemTapped(0),
        child: Icon(Icons.home, color: Colors.red, size: 30),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
