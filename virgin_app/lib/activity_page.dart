import 'package:flutter/material.dart';
import 'home_page.dart'; // Per la navigazione verso la home
import 'ticket_page.dart'; // Per la navigazione verso tickets
import 'airplane_booking_page.dart'; // Importazione della versione completa di AirplaneBookingPage

// Pagine di prenotazione con design migliorato
class TrainBookingPage extends StatelessWidget {
  final Color virginRed = Color(0xFFE50914);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Train Booking',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: virginRed,
        elevation: 2,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.train, size: 80, color: virginRed),
            SizedBox(height: 20),
            Text(
              'Train Booking',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Book train tickets for your next trip',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text('Start Booking'),
              style: ElevatedButton.styleFrom(
                backgroundColor: virginRed,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GymPage extends StatelessWidget {
  final Color virginRed = Color(0xFFE41B13); // Rosso Virgin Active
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Virgin Active',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: virginRed,
        elevation: 2,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.fitness_center, size: 80, color: virginRed),
            SizedBox(height: 20),
            Text(
              'Gym & Fitness',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Book a class at Virgin Active',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text('View Classes'),
              style: ElevatedButton.styleFrom(
                backgroundColor: virginRed,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoviePage extends StatelessWidget {
  final Color virginRed = Color(0xFF760027); // Rosso Virgin Radio
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Entertainment',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: virginRed,
        elevation: 2,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_note, size: 80, color: virginRed),
            SizedBox(height: 20),
            Text(
              'Virgin Radio Events',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Find concerts and events near you',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text('Explore Events'),
              style: ElevatedButton.styleFrom(
                backgroundColor: virginRed,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ActivityPage con design migliorato e navbar
class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final Color virginRed = Color(0xFFE50914);

  // Metodo per gestire la navigazione
  void _onItemTapped(int index) {
    if (index == 0) {
      // Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else if (index == 1) {
      // Tickets
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TicketsPage()),
      );
    }
    // Altre opzioni di navigazione possono essere aggiunte qui
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Welcome to Virgin Activities',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: virginRed,
        elevation: 2,
        centerTitle: false,
        // Freccia indietro standard a sinistra
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Torna alla HomePage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              
              // Sezione Viaggi
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 16),
                    child: Text(
                      'Travel',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActivityCard(
                        context,
                        icon: Icons.airplanemode_active,
                        title: 'Flights',
                        color: Colors.redAccent,
                        page: AirplaneBookingPage(), // Ora usa la versione completa
                      ),
                      _buildActivityCard(
                        context,
                        icon: Icons.train,
                        title: 'Trains',
                        color: Colors.redAccent[400]!,
                        page: TrainBookingPage(),
                      ),
                    ],
                  ),
                ],
              ),
              
              SizedBox(height: 32),
              
              // Sezione Salute
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 16),
                    child: Text(
                      'Health & Fitness',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildActivityCard(
                        context,
                        icon: Icons.fitness_center,
                        title: 'Gym',
                        color: Color(0xFFE41B13),
                        page: GymPage(),
                      ),
                    ],
                  ),
                ],
              ),
              
              SizedBox(height: 32),
              
              // Sezione Intrattenimento
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 16),
                    child: Text(
                      'Entertainment',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildActivityCard(
                        context,
                        icon: Icons.music_note,
                        title: 'Events',
                        color: Color(0xFF760027),
                        page: MoviePage(),
                      ),
                    ],
                  ),
                ],
              ),
              
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      // FAB per aggiungere nuovi elementi
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Naviga alla home
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.home, color: virginRed, size: 30),
        elevation: 4,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: virginRed,
        clipBehavior: Clip.antiAlias,
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Current page (Activity) - highlighted
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {}, // Già nella pagina Activity
              tooltip: 'Activity',
            ),
            IconButton(
              icon: Icon(Icons.confirmation_number, color: Colors.white),
              onPressed: () => _onItemTapped(1), // Tickets page
              tooltip: 'Tickets',
            ),
            SizedBox(width: 50), // Spazio per il FAB
            IconButton(
              icon: Icon(Icons.groups, color: Colors.white),
              onPressed: () {}, // Implementare navigazione alla pagina Community
              tooltip: 'Community',
            ),
            IconButton(
              icon: Icon(Icons.military_tech, color: Colors.white),
              onPressed: () {}, // Implementare navigazione alla pagina Achievements
              tooltip: 'Achievements',
            ),
          ],
        ),
      ),
    );
  }
  
  // Widget helper per creare una card di attività
  Widget _buildActivityCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required Widget page,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: 150,
        padding: EdgeInsets.all(4),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(icon, color: color, size: 36),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
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