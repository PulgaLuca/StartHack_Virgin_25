import 'package:flutter/material.dart';
import 'airplane_booking_page.dart';
import 'widgets/avatar_widget.dart';

final Color virginRed = Color(0xFFE50914);

class TrainBookingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Hotel Booking',
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
        actions: [
          // Avatar in alto a destra
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: AvatarWidget(
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.hotel, size: 80, color: virginRed),
            SizedBox(height: 20),
            Text(
              'Hotel Booking',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Book hotel room for your next trip',
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
        actions: [
          // Avatar in alto a destra
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: AvatarWidget(
              size: 40,
            ),
          ),
        ],
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
        actions: [
          // Avatar in alto a destra
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: AvatarWidget(
            ),
          ),
        ],
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

// ActivityPage con design migliorato, loghi aziendali e riferimenti visivi ai servizi
class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Virgin Experiences',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: virginRed,
        elevation: 2,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: [
          // Avatar in alto a destra
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: AvatarWidget(
            ),
          ),
        ],
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
                      _buildEnhancedCard(
                        context,
                        logo: 'assets/virgin_atlantic_logo.png',
                        title: 'Flights',
                        subtitle: 'Virgin Atlantic',
                        color: virginRed,
                        iconData: Icons.airplanemode_active,
                        page: AirplaneBookingPage(),
                        backgroundImage: 'assets/airplane.jpeg',
                      ),
                      _buildEnhancedCard(
                        context,
                        logo: 'assets/virgin_hotels_logo.png',
                        title: 'Hotels',
                        subtitle: 'Virgin Hotels',
                        color: virginRed,
                        iconData: Icons.hotel,
                        page: TrainBookingPage(),
                        backgroundImage: 'assets/hotel.jpg',
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
                      _buildEnhancedCard(
                        context,
                        logo: 'assets/virgin_active_logo.png',
                        title: 'Fitness',
                        subtitle: 'Virgin Active',
                        color: virginRed,
                        iconData: Icons.fitness_center,
                        page: GymPage(),
                        backgroundImage: 'assets/gym.jpg',
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
                      _buildEnhancedCard(
                        context,
                        logo: 'assets/virgin_radio_logo.png',
                        title: 'Events',
                        subtitle: 'Virgin Radio',
                        color: virginRed,
                        iconData: Icons.music_note,
                        page: MoviePage(),
                        backgroundImage: 'assets/radio.jpg',
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
    );
  }
  
  // Widget avanzato per creare card con logo aziendale e immagine di sfondo
  Widget _buildEnhancedCard(
    BuildContext context, {
    required String logo,
    required String title,
    required String subtitle,
    required Color color,
    required IconData iconData,
    required Widget page,
    required String backgroundImage,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: 165,
        height: 240, // Aumentata l'altezza da 220 a 240 per risolvere l'overflow
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                // Immagine di sfondo sfumata
                Positioned.fill(
                  child: Image.asset(
                    backgroundImage,
                    fit: BoxFit.cover,
                  ),
                ),
                // Overlay gradient scuro
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ),
                // Contenuto della card
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo aziendale in alto
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Image.asset(
                            logo,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Spacer(),
                      // Icona relativa al servizio
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          iconData,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      SizedBox(height: 8),
                      // Titolo e sottotitolo
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16, // Ridotta da 18 a 16
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(height: 4), // Ridotto da 8 a 4
                      // Pulsante di azione
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => page),
                            );
                          },
                          child: Text('Explore'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: color,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            minimumSize: Size(double.infinity, 30),
                          ),
                        ),
                      ),
                    ],
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