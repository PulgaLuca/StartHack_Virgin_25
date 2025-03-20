import 'package:flutter/material.dart';
import 'activity_page.dart';
import 'ticket_page.dart';
import 'login_page.dart'; // Importa la pagina di login
import 'package:virgin_app/badges_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final Color virginRed = Color(0xFFE50914); // Stesso colore rosso Virgin
  
  // Pagine per il tab navigator
  final List<Widget> _pages = [
    HomeContent(), // Una classe separata per il contenuto della home
    Center(child: Text('Community Page')),
    Center(child: Text('Profile Page')),
    Center(child: Text('Home Page Content')),
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
      appBar: AppBar(
        title: Text(
          'Virgin',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: virginRed,
        elevation: 2,
        actions: [
          // Pulsante profilo o logout
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {
              // Mostra opzioni profilo o logout
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Account'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.person, color: virginRed),
                        title: Text('My Profile'),
                        onTap: () {
                          Navigator.pop(context);
                          // Naviga al profilo
                        },
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.logout, color: virginRed),
                        title: Text('Logout'),
                        onTap: () {
                          Navigator.pop(context);
                          // Torna alla pagina di login
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: virginRed,
        clipBehavior: Clip.antiAlias,
        notchMargin: 8, // Aumentato il margine della notch
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActivityPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.confirmation_number, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicketsPage()),
                );
              },
            ),
            SizedBox(width: 50), // Spazio per l'icona centrale Home
            IconButton(
              icon: Icon(Icons.groups, color: Colors.white),
              onPressed: () => _onItemTapped(1),
              tooltip: 'Community',
            ),
            IconButton(
              icon: Icon(Icons.military_tech, color: Colors.white),
              onPressed: () => _onItemTapped(4),
              tooltip: 'Badges',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => _onItemTapped(0),
        child: Icon(Icons.home, color: virginRed, size: 30),
        shape: CircleBorder(),
        tooltip: 'Home',
        elevation: 4,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// Classe separata per il contenuto della home
class HomeContent extends StatelessWidget {
  final Color virginRed = Color(0xFFE50914);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back, User!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Your next flight is on April 15, 2023',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TicketsPage()),
                        );
                      },
                      child: Text('View Tickets'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: virginRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 24),
            
            // Section title
            Text(
              'Featured Promotions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            SizedBox(height: 16),
            
            // Scrollable cards for promotions
            Container(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildPromoCard(
                    'Special Offer',
                    '30% Off Next Flight',
                    Icons.local_offer,
                  ),
                  _buildPromoCard(
                    'Gym Membership',
                    'Join Virgin Active',
                    Icons.fitness_center,
                  ),
                  _buildPromoCard(
                    'Live Concert',
                    'Virgin Radio Festival',
                    Icons.music_note,
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 24),
            
            // Section title
            Text(
              'Your Activity',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            SizedBox(height: 16),
            
            // Recent activity list
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: virginRed.withOpacity(0.2),
                      child: Icon(Icons.airplane_ticket, color: virginRed),
                    ),
                    title: Text('Ticket Purchased'),
                    subtitle: Text('Flight to London - Apr 15'),
                    trailing: Text('2d ago'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: virginRed.withOpacity(0.2),
                      child: Icon(Icons.fitness_center, color: virginRed),
                    ),
                    title: Text('Gym Check-in'),
                    subtitle: Text('Virgin Active Milan'),
                    trailing: Text('5d ago'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: virginRed.withOpacity(0.2),
                      child: Icon(Icons.music_note, color: virginRed),
                    ),
                    title: Text('Event Ticket'),
                    subtitle: Text('Virgin Radio Live Festival'),
                    trailing: Text('1w ago'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildPromoCard(String title, String subtitle, IconData icon) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 16),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: virginRed, size: 32),
              SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                'Learn more',
                style: TextStyle(
                  color: virginRed,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}