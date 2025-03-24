import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'widgets/avatar_widget.dart';
import 'activity_page.dart';
import 'ticket_page.dart';
import 'community_page.dart';
import 'badges_page.dart';

// Variabili globali
final Color virginRed = Color(0xFFE50914);
final int userPoints = 7500;
final String userName = "Sarah";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  
  
  // Pagine per il tab navigator
  final List<Widget> _pages = [
    HomeContent(), // Una classe separata per il contenuto della home
    CommunityPage(),
    ActivityPage(),
    TicketsPage(),
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
        color: virginRed,
        notchMargin: 8,
        height: 70, // Altezza Bottom Bar
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(Icons.confirmation_number, color: Colors.white),
              onPressed: () => _onItemTapped(3),
            ),
            SizedBox(width: 50),
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
        shape: CircleBorder(),
        elevation: 4,
        child: Icon(Icons.home, color: virginRed, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// Classe separata per il contenuto della home con video
class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  
  late VideoPlayerController _videoController;
  bool _isVideoInitialized = false;
  
  @override
  void initState() {
    super.initState();
    // Inizializza il controller del video
    _videoController = VideoPlayerController.asset('assets/VI_avatar.mov')
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
        // Avvia il video in loop
        _videoController.setLooping(true);
        _videoController.play();
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
  
  // Dati simulati per i livelli di premio
  final List<Map<String, dynamic>> rewards = [
    {
      'points': 5000,
      'title': '10% Discount',
      'description': 'Flight ticket discount',
      'icon': Icons.local_offer,
    },
    {
      'points': 7500,
      'title': '15% Discount',
      'description': 'Flight ticket discount',
      'icon': Icons.attach_money,
    },
    {
      'points': 10000,
      'title': '20% Discount',
      'description': 'Flight ticket discount',
      'icon': Icons.card_giftcard,
    },
    {
      'points': 20000,
      'title': 'Priority Boarding',
      'description': '30% discount + priority',
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

  // Nuovi dati per l'impatto ambientale e sociale delle attività
  final List<Map<String, dynamic>> activityImpact = [
    {
      'activity': 'Ticket Purchased',
      'detail': 'Flight to London - Apr 15',
      'daysAgo': '2d ago',
      'points': '+250 pts',
      'icon': Icons.airplane_ticket,
      'logoPath': 'assets/virgin_atlantic_logo.png',
      'impactTitle': 'Carbon Reduction',
      'impactDescription': 'Virgin\'s newest fleet saved 15% CO2 vs other airlines',
      'impactIcon': Icons.bolt,
      'impactValue': '102 kg CO2 saved'
    },
    {
      'activity': 'Gym Check-in',
      'detail': 'Virgin Active Milan',
      'daysAgo': '5d ago',
      'points': '+50 pts',
      'icon': Icons.fitness_center,
      'logoPath': 'assets/virgin_active_logo.png',
      'impactTitle': 'Energy Efficiency',
      'impactDescription': 'Our eco-gym uses 40% less energy than standard facilities',
      'impactIcon': Icons.bolt,
      'impactValue': '2.5 kWh saved'
    },
    {
      'activity': 'Event Ticket',
      'detail': 'Virgin Radio Live Festival',
      'daysAgo': '1w ago',
      'points': '+100 pts',
      'icon': Icons.music_note,
      'logoPath': 'assets/virgin_radio_logo.png',
      'impactTitle': 'Plastic Reduction',
      'impactDescription': 'Our zero-plastic policy at events reduces waste',
      'impactIcon': Icons.delete_outline,
      'impactValue': '4 plastic bottles saved'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Contenuto principale con padding in alto per compensare l'appbar
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner di benvenuto migliorato
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFD70417), // Rosso più scuro
                      virginRed,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Elementi di design (pattern a puntini sovrapposti)
                    Positioned(
                      top: -5,
                      right: -5,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.05),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      right: 100,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.07),
                        ),
                      ),
                    ),
                    // Contenuto principale
                    Padding(
                      padding: EdgeInsets.fromLTRB(24, 60, 24, 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Colonna del testo di benvenuto
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Testo di benvenuto con ombra
                              Text(
                                'Welcome Back,',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.9),
                                  shadows: [
                                    Shadow(
                                      offset: Offset(0, 1),
                                      blurRadius: 3,
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                userName + '!',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 1.1,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(0, 1),
                                      blurRadius: 3,
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                          
                          // Avatar in alto a destra
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: AvatarWidget(
                              size: 50,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Video su sfondo bianco
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: _isVideoInitialized
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 340,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey[300]!, width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          clipBehavior: Clip.antiAlias, // Bordi arrotondati
                          child: VideoPlayer(_videoController),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 340, // Aumentata l'altezza qui
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: virginRed,
                            ),
                          ),
                        ),
                ),
              ),
              
              //Reward Levels con punti e redeem SULLA STESSA RIGA
              Padding(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 0), // Ridotto lo spazio superiore
                child: Column(
                  children: [
                    // Titolo 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reward Levels',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 6), // Ridotto lo spazio tra titolo e riga successiva
                    
                    // Riga con punti e pulsante redeem sullo stesso livello
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Contatore punti
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: virginRed.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.stars, color: Colors.amber, size: 18),
                              SizedBox(width: 4),
                              Text(
                                '$userPoints points',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: virginRed,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Pulsante redeem
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.redeem, size: 18),
                          label: Text('Redeem'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: virginRed,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Reward levels list
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 8), // Ridotto lo spazio sopra la lista
                  itemCount: rewards.length,
                  itemBuilder: (context, index) {
                    final reward = rewards[index];
                    final bool isUnlocked = userPoints >= reward['points'];
                    
                    return Card(
                      elevation: 2,
                      margin: EdgeInsets.only(bottom: 8), // Ridotto lo spazio tra card
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
              
              // Your Impact Activity
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0), // Ridotto lo spazio
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Impact Activity',
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
              
              // Recent activity list
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 4), // Ridotto lo spazio in alto
                  itemCount: activityImpact.length,
                  itemBuilder: (context, index) {
                    final activity = activityImpact[index];
                    
                    final Color impactColor = Colors.green[700]!;

                    
                    return Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: EdgeInsets.only(bottom: 8), // Ridotto lo spazio tra card
                      child: Column(
                        children: [
                          // l'attività con logo Virgin
                          ListTile(
                            leading: Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey[200]!, width: 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(8),
                              child: Image.asset(
                                activity['logoPath'], // Prende dai dati statici
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Text(activity['activity']), // Prende dai dati statici
                            subtitle: Text(activity['detail']), // Prende dai dati statici
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  activity['daysAgo'], // Prende dai dati statici
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  activity['points'], // Prende dai dati statici
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // l'impatto positivo - VERDE
                          Container(
                            decoration: BoxDecoration(
                              color: impactColor.withOpacity(0.08), // Colore trasparente in base al tipo
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: impactColor.withOpacity(0.15), // Cerchio del colore appropriato
                                  child: Icon(
                                    activity['impactIcon'], // Prende dai dati statici
                                    size: 18,
                                    color: impactColor, // Icona del colore appropriato
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        activity['impactTitle'], // Prende dai dati statici
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: impactColor.withOpacity(0.9), // Titolo del colore appropriato
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        activity['impactDescription'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: impactColor.withOpacity(0.1), // Badge del colore appropriato
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    activity['impactValue'], // Prende dai dati statici
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: impactColor.withOpacity(0.9), // Testo del colore appropriato
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
