import 'package:flutter/material.dart';
import 'activity_page.dart';
import 'ticket_page.dart';
import 'login_page.dart';
import 'community_page.dart'; // Importa la pagina community
import 'login_page.dart'; // Importa la pagina di login
import 'package:virgin_app/badges_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final Color virginRed = Color(0xFFE50914); // Stesso colore rosso Virgin
  
  // Dati simulati per i punti dell'utente
  final int userPoints = 7500;
  
  // Dati simulati per i livelli di premio
  final List<Map<String, dynamic>> rewards = [
    {
      'points': 5000,
      'title': '10% Discount',
      'description': 'Flight ticket discount',
      'isUnlocked': true,
      'icon': Icons.local_offer,
    },
    {
      'points': 7500,
      'title': '15% Discount',
      'description': 'Flight ticket discount',
      'isUnlocked': true,
      'icon': Icons.attach_money,
    },
    {
      'points': 10000,
      'title': '20% Discount',
      'description': 'Flight ticket discount',
      'isUnlocked': false,
      'icon': Icons.card_giftcard,
    },
    {
      'points': 20000,
      'title': 'Priority Boarding',
      'description': '30% discount + priority',
      'isUnlocked': false,
      'icon': Icons.flight_takeoff,
    },
    {
      'points': 50000,
      'title': 'Business Upgrade',
      'description': '50% discount + business class',
      'isUnlocked': false,
      'icon': Icons.airline_seat_flat,
    },
  ];
  
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
          // Pulsante punti
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Icon(Icons.stars, color: Colors.amber, size: 18),
                SizedBox(width: 4),
                Text(
                  '$userPoints',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
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
              onPressed: () {
                // Navigazione alla pagina Community
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityPage()),
                );
              },
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
  final int userPoints = 7500;
  
  // Dati simulati per i livelli di premio
  final List<Map<String, dynamic>> rewards = [
    {
      'points': 5000,
      'title': '10% Discount',
      'description': 'Flight ticket discount',
      'isUnlocked': true,
      'icon': Icons.local_offer,
    },
    {
      'points': 7500,
      'title': '15% Discount',
      'description': 'Flight ticket discount',
      'isUnlocked': true,
      'icon': Icons.attach_money,
    },
    {
      'points': 10000,
      'title': '20% Discount',
      'description': 'Flight ticket discount',
      'isUnlocked': false,
      'icon': Icons.card_giftcard,
    },
    {
      'points': 20000,
      'title': 'Priority Boarding',
      'description': '30% discount + priority',
      'isUnlocked': false,
      'icon': Icons.flight_takeoff,
    },
    {
      'points': 50000,
      'title': 'Business Upgrade',
      'description': '50% discount + business class',
      'isUnlocked': false,
      'icon': Icons.airline_seat_flat,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner superiore con punti
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  virginRed,
                  virginRed.withOpacity(0.8),
                ],
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back, Sarah!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.stars, color: Colors.amber, size: 18),
                          SizedBox(width: 4),
                          Text(
                            '$userPoints',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            'points',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.redeem, color: Colors.white),
                      label: Text(
                        'Redeem',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Prossimo volo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: virginRed.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.flight,
                            color: virginRed,
                            size: 24,
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your next flight',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                            Text(
                              'Milan to London',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: virginRed.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Apr 15',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: virginRed,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.schedule, size: 14, color: Colors.grey),
                            SizedBox(width: 4),
                            Text(
                              '10:00 AM',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 80,
                          height: 1,
                          color: Colors.grey[300],
                        ),
                        Row(
                          children: [
                            Icon(Icons.timer, size: 14, color: Colors.grey),
                            SizedBox(width: 4),
                            Text(
                              '2h 15m',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TicketsPage()),
                              );
                            },
                            child: Text('View Ticket'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: virginRed,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            'Check-in',
                            style: TextStyle(color: virginRed),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: virginRed),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Section title - Reward Levels
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reward Levels',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: virginRed.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.stars, color: virginRed, size: 16),
                      SizedBox(width: 4),
                      Text(
                        '$userPoints pts',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: virginRed,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 16),
          
          // Reward levels list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: rewards.length,
              itemBuilder: (context, index) {
                final reward = rewards[index];
                final bool isUnlocked = userPoints >= reward['points'];
                
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: isUnlocked
                          ? LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.white, Colors.white])
                          : LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.grey[100]!, Colors.grey[100]!],
                            ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: isUnlocked
                              ? virginRed.withOpacity(0.1)
                              : Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            reward['icon'],
                            color: isUnlocked ? virginRed : Colors.grey[500],
                            size: 24,
                          ),
                        ),
                      ),
                      title: Text(
                        reward['title'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isUnlocked ? Colors.black87 : Colors.grey[700],
                        ),
                      ),
                      subtitle: Text(
                        reward['description'],
                        style: TextStyle(
                          color: isUnlocked ? Colors.grey[700] : Colors.grey[500],
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${reward['points']} pts',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: isUnlocked ? virginRed : Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 4),
                          Icon(
                            isUnlocked ? Icons.check_circle : Icons.lock,
                            color: isUnlocked ? Colors.green : Colors.grey[400],
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          
          SizedBox(height: 16),
          
          // Section title - Your Activity
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Your Activity',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(
                      color: virginRed,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 8),
          
          // Recent activity list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
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
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '2d ago',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '+250 pts',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: virginRed.withOpacity(0.2),
                      child: Icon(Icons.fitness_center, color: virginRed),
                    ),
                    title: Text('Gym Check-in'),
                    subtitle: Text('Virgin Active Milan'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '5d ago',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '+50 pts',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: virginRed.withOpacity(0.2),
                      child: Icon(Icons.music_note, color: virginRed),
                    ),
                    title: Text('Event Ticket'),
                    subtitle: Text('Virgin Radio Live Festival'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '1w ago',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '+100 pts',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 24),
        ],
      ),
    );
  }
}