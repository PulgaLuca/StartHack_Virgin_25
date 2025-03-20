import 'package:flutter/material.dart';

class AirplaneBookingPage extends StatefulWidget {
  @override
  _AirplaneBookingPageState createState() => _AirplaneBookingPageState();
}

// Widget Avatar riutilizzabile
class AvatarWidget extends StatelessWidget {
  final String imagePath; 
  final double size;
  final VoidCallback? onTap;

  const AvatarWidget({
    Key? key,
    this.imagePath = 'assets/profile_image.png',
    this.size = 40,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {
        // Mostra un menu o naviga al profilo
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Your Profile'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF58D68D), // Sfondo verde
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Sarah Rossi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text('7,500 points'),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Close'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE50914),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF58D68D), // Sfondo verde
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _AirplaneBookingPageState extends State<AirplaneBookingPage> {
  // Helper per creare una card promozione 
  Widget _buildPromoCard(String title, String description, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: virginRed.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: virginRed,
                  size: 30,
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
              SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  final Color virginRed = Color(0xFFE50914);
  
  // Campi per la prenotazione
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  final _dateController = TextEditingController();
  
  // Dati simulati per i punti dell'utente
  final int userPoints = 7500;
  
  // Dati simulati per le promozioni
  final List<Map<String, dynamic>> discounts = [
    {
      'points': 5000,
      'discount': '10%',
      'description': 'Sconto del 10% sul prezzo del biglietto',
      'isAvailable': true,
    },
    {
      'points': 7500,
      'discount': '15%',
      'description': 'Sconto del 15% sul prezzo del biglietto',
      'isAvailable': true,
    },
    {
      'points': 10000,
      'discount': '20%',
      'description': 'Sconto del 20% sul prezzo del biglietto',
      'isAvailable': false,
    },
    {
      'points': 20000,
      'discount': '30%',
      'description': 'Sconto del 30% sul prezzo del biglietto + imbarco prioritario',
      'isAvailable': false,
    },
    {
      'points': 50000,
      'discount': '50%',
      'description': 'Sconto del 50% sul prezzo del biglietto + upgrade classe business',
      'isAvailable': false,
    },
  ];
  
  // Dati simulati per i voli disponibili
  final List<Map<String, dynamic>> flights = [
    {
      'from': 'Milan (MXP)',
      'to': 'Zurich (ZRH)',
      'date': '15 Apr 2025',
      'time': '10:00 AM',
      'duration': '1h 05m',
      'price': '€149.99',
      'airline': 'Virgin Atlantic',
    },
    {
      'from': 'Milan (MXP)',
      'to': 'London (LHR)',
      'date': '18 Apr 2025',
      'time': '02:30 PM',
      'duration': '2h 15m',
      'price': '€189.99',
      'airline': 'Virgin Atlantic',
    },
    {
      'from': 'Milan (MXP)',
      'to': 'New York (JFK)',
      'date': '22 Apr 2025',
      'time': '08:15 AM',
      'duration': '8h 45m',
      'price': '€529.99',
      'airline': 'Virgin Atlantic',
    },
  ];
  
  @override
  void initState() {
    super.initState();
    _fromController.text = 'Milan (MXP)';
    _toController.text = 'Zurich (ZRH)';
    _dateController.text = 'Apr 15, 2025';
  }
  
  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Flight Booking',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: [
          // Avatar in alto a destra
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: AvatarWidget(
              imagePath: 'assets/mostro2_profilo.png',
              size: 40,
            ),
          ),
        ],
        backgroundColor: virginRed,
        elevation: 2,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header con logo banner invece del testo
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: virginRed.withOpacity(0.05),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo Virgin Atlantic come immagine
                  Image.asset(
                    'assets/virgin_atlantic_logo.png', // Assicurati che questo file esista nel progetto
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Book your next journey and earn reward points',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            // Sezione di ricerca voli
            Padding(
              padding: EdgeInsets.all(16),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Search Flights',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 16),
                      // Da
                      TextField(
                        controller: _fromController,
                        decoration: InputDecoration(
                          labelText: 'From',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.flight_takeoff, color: virginRed),
                        ),
                      ),
                      SizedBox(height: 12),
                      // A
                      TextField(
                        controller: _toController,
                        decoration: InputDecoration(
                          labelText: 'To',
                          hintText: 'Enter destination',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.flight_land, color: virginRed),
                        ),
                      ),
                      SizedBox(height: 12),
                      // Data
                      TextField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          labelText: 'Departure Date',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.calendar_today, color: virginRed),
                        ),
                        onTap: () async {
                          // Mostra il date picker quando si tocca il campo
                          FocusScope.of(context).requestFocus(new FocusNode());
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now().add(Duration(days: 1)),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                            builder: (context, child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  primaryColor: virginRed,
                                  colorScheme: ColorScheme.light(primary: virginRed),
                                  buttonTheme: ButtonThemeData(
                                    textTheme: ButtonTextTheme.primary,
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (picked != null) {
                            setState(() {
                              _dateController.text = '${_getMonthName(picked.month)} ${picked.day}, ${picked.year}';
                            });
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      // Pulsante di ricerca
                      Container(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.search),
                          label: Text('Search Flights'),
                          onPressed: () {
                            // Simula la ricerca di un volo e mostra la conferma
                            Map<String, dynamic> sampleFlight = flights[0]; // Usa il primo volo come esempio
                            _showBookingConfirmationDialog(context, sampleFlight);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: virginRed,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Promotions
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Promotions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: _buildPromoCard(
                        'Special Offer',
                        '30% Off Next Flight',
                        Icons.local_offer,
                      )),
                      Expanded(child: _buildPromoCard(
                        'Gym Membership',
                        'Join Virgin Active',
                        Icons.fitness_center,
                      )),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: _buildPromoCard(
                        'Live Concert',
                        'Virgin Radio Festival',
                        Icons.music_note,
                      )),
                      Expanded(child: _buildPromoCard(
                        'Free Upgrade',
                        'Premium Economy Seat',
                        Icons.airline_seat_recline_extra,
                      )),
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
  
  // Helper per mostrare il nome del mese
  String _getMonthName(int month) {
    const monthNames = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return monthNames[month];
  }
  
  // Mostra il dialogo di conferma prenotazione
  void _showBookingConfirmationDialog(BuildContext context, Map<String, dynamic> flight) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Booking'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Would you like to book the following flight?'),
                SizedBox(height: 16),
                Text('${flight['from']} → ${flight['to']}', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('Date: ${flight['date']}'),
                Text('Time: ${flight['time']}'),
                Text('Duration: ${flight['duration']}'),
                SizedBox(height: 8),
                Text('Price: ${flight['price']}', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                Text('You will earn 250 points with this booking!', 
                  style: TextStyle(color: virginRed, fontStyle: FontStyle.italic)),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel', style: TextStyle(color: Colors.grey[700])),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Confirm'),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Flight booked successfully! Confirmation sent to your email.'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: virginRed,
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }
}