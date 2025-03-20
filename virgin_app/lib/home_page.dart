import 'package:flutter/material.dart';
import 'activity_page.dart'; // Importa il file activity_page.dart
import 'ticket_page.dart'; // Assicurati che questo file esista e contenga la classe TicketsPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Home Page Content')),
    // Puoi aggiungere altre pagine se vuoi
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.red,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.red,
        clipBehavior: Clip.antiAlias,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // Spazio uniforme tra le icone
          children: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white), // Menu (Activity)
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActivityPage()), // Naviga alla ActivityPage
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.confirmation_number, color: Colors.white), // Biglietto
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicketsPage()), // Naviga alla TicketsPage
                );
              },
            ),
            SizedBox(width: 50), // Spazio per l'icona centrale Home
            IconButton(
              icon: Icon(Icons.groups, color: Colors.white), // Community
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(Icons.military_tech, color: Colors.white), // Medaglia
              onPressed: () => _onItemTapped(3),
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
