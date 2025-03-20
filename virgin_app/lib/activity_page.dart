import 'package:flutter/material.dart';

// Pagine di prenotazione
class AirplaneBookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prenotazione Aereo'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text('Pagina di prenotazione aereo'),
      ),
    );
  }
}

class TrainBookingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prenotazione Treno'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text('Pagina di prenotazione treno'),
      ),
    );
  }
}

class GymPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Palestra'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text('Pagina della palestra'),
      ),
    );
  }
}

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intrattenimento'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text('Pagina intrattenimento'),
      ),
    );
  }
}

// ActivityPage con le sezioni
class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity Page'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Sezione Viaggi
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Viaggi',
                    style: TextStyle(
                      fontSize: 24, // Titolo più grande
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20), // Distanza tra titolo e icone
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Naviga alla pagina di prenotazione aereo
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AirplaneBookingPage()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 40, // Icona più grande
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.airplanemode_active, color: Colors.white, size: 40),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Naviga alla pagina di prenotazione treno
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TrainBookingPage()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 40, // Icona più grande
                          backgroundColor: Colors.green,
                          child: Icon(Icons.train, color: Colors.white, size: 40),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Sezione Salute
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Salute',
                    style: TextStyle(
                      fontSize: 24, // Titolo più grande
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20), // Distanza tra titolo e icone
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Naviga alla pagina della palestra
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GymPage()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 40, // Icona più grande
                          backgroundColor: Colors.orange,
                          child: Icon(Icons.fitness_center, color: Colors.white, size: 40),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Sezione Intrattenimento
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Intrattenimento',
                    style: TextStyle(
                      fontSize: 24, // Titolo più grande
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20), // Distanza tra titolo e icone
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Naviga alla pagina di intrattenimento
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MoviePage()),
                          );
                        },
                        child: CircleAvatar(
                          radius: 40, // Icona più grande
                          backgroundColor: Colors.purple,
                          child: Icon(Icons.movie, color: Colors.white, size: 40),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
