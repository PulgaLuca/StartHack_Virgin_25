import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class TicketsPage extends StatefulWidget {
  @override
  _TicketsPageState createState() => _TicketsPageState();
}

// Classe Avatar globale riutilizzabile in tutte le pagine
class AvatarWidget extends StatelessWidget {
  final String imagePath; 
  final double size;
  final VoidCallback? onTap;

  const AvatarWidget({
    Key? key,
    this.imagePath = 'assets/profile_image.png', // Immagine di default dell'utente
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

class _TicketsPageState extends State<TicketsPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int _selectedCardIndex = -1;
  bool _isCardExpanded = false;
  final Color virginRed = Color(0xFFE50914);
  
  // Definizione dei colori di sfondo per gli avatar con maggiore contrasto
  final Map<String, Color> avatarBackgrounds = {
    'assets/mostro2_profilo.png': Color(0xFF5DADE2), // Blu chiaro
    'assets/mostro3_profilo.png': Color(0xFFF4D03F), // Giallo
    'assets/mostro4_profilo.png': Color(0xFF58D68D), // Verde
  };
  
  // Definizione dei biglietti (in stile iOS Wallet)
  final List<Map<String, dynamic>> tickets = [
    {
      'type': 'travel',
      'title': 'Departure and Destination',
      'from': 'MXP',
      'to': 'LHR',
      'date': '15 APR',
      'time': '10:00',
      'flightNumber': 'VS206',
      'gate': '14',
      'seat': '12A',
      'backgroundColor': Color(0xFFE50914),
      'textColor': Colors.white,
      'logoPath': 'assets/virgin_atlantic_logo.png',
      'company': 'Virgin Atlantic',
      'fromCity': 'Milan',
      'toCity': 'London'
    },
    {
      'type': 'membership',
      'title': 'Gym Access',
      'membershipNumber': '9876543210',
      'validUntil': '15 MAY 2025',
      'backgroundColor': Color(0xFFE50914),
      'textColor': Colors.white,
      'logoPath': 'assets/virgin_active_logo.png',
      'company': 'Virgin Active',
      'membershipType': 'Premium Subscription',
      'memberName': 'Sarah Rossi',
      'memberLevel': 'VIP'
    },
    {
      'type': 'event',
      'title': 'Live Concert',
      'eventName': 'Virgin Radio Live Festival',
      'date': '22 JUN',
      'time': '19:30',
      'location': 'San Siro Stadium, Milan',
      'seat': 'Section B, Row 10, Seat 45',
      'backgroundColor': Color(0xFFE50914),
      'textColor': Colors.white,
      'logoPath': 'assets/virgin_radio_logo.png',
      'company': 'Virgin Radio'
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleCardExpansion(int index) {
    setState(() {
      if (_selectedCardIndex == index && _isCardExpanded) {
        // Close the ticket
        _isCardExpanded = false;
        _animationController.reverse();
      } else {
        // Open the ticket
        _selectedCardIndex = index;
        _isCardExpanded = true;
        _animationController.forward(from: 0.0);
      }
    });
  }

  void _showAddFriendsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Friends'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Search friends',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                _buildFriendItem('Luca Verdi', 'assets/mostro2_profilo.png', Colors.pink),
                _buildFriendItem('Sofia Russo', 'assets/mostro3_profilo.png', Colors.lightBlue),
                _buildFriendItem('Marco Bruno', 'assets/mostro4_profilo.png', Colors.yellow),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement the logic to add selected friends
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Friends invited successfully!'),
                    backgroundColor: virginRed,
                  ),
                );
              },
              child: Text('Invite', style: TextStyle(color: virginRed)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFriendItem(String name, String imagePath, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: color,
          ),
          SizedBox(width: 15),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Checkbox(
            value: false,
            onChanged: (value) {},
            activeColor: virginRed,
          ),
        ],
      ),
    );
  }
  
  Widget _buildFriendAvatar(String imagePath, Color color) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: avatarBackgrounds[imagePath] ?? Colors.white,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(imagePath),
        backgroundColor: color,
      ),
    );
  }

  Widget _buildCard(int index, Map<String, dynamic> ticket) {
    final bool isSelected = _selectedCardIndex == index;
    
    // Calcolo iniziale della posizione di default delle carte quando sono tutte chiuse
    // Ogni carta è posizionata più in basso rispetto alla precedente
    double initialTopPosition = 20.0 + (index * 80.0);
    
    // Se una carta è selezionata, riposiziona le altre
    double topMargin;
    if (_isCardExpanded) {
      if (isSelected) {
        // La carta selezionata va in alto
        topMargin = 20.0;
      } else if (index < _selectedCardIndex) {
        // Le carte sopra quella selezionata si spostano più in alto
        topMargin = 10.0;
      } else {
        // Le carte sotto quella selezionata vanno in fondo
        topMargin = 500.0;
      }
    } else {
      // Quando tutte le carte sono chiuse, mantieni la posizione a cascata
      topMargin = initialTopPosition;
    }
    
    final double opacity = isSelected ? 1.0 : (_isCardExpanded ? 0.7 : 1.0);
    
    // Ulteriormente aumentata l'altezza del biglietto espanso 
    final double cardHeight;
    if (isSelected && _isCardExpanded) {
      // Altezza specifica in base al tipo di biglietto
      if (ticket['type'] == 'event') {
        cardHeight = 500; // Più alta per Virgin Radio
      } else {
        cardHeight = 480; // Per gli altri tipi
      }
    } else {
      cardHeight = 200; // Altezza standard quando chiuso
    }
    
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      top: topMargin,
      left: 16,
      right: 16,
      child: GestureDetector(
        onTap: () => _toggleCardExpansion(index),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: opacity,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: cardHeight,
                decoration: BoxDecoration(
                  color: ticket['backgroundColor'],
                ),
                child: Stack(
                  children: [
                    _buildCardContent(ticket, isSelected && _isCardExpanded),
                    
                    // Bottone "Add Friends" in basso a destra
                    if (isSelected && _isCardExpanded)
                      Positioned(
                        right: 20,
                        bottom: 20,
                        child: FloatingActionButton.small(
                          heroTag: "addFriend_$index",
                          onPressed: _showAddFriendsDialog,
                          backgroundColor: ticket['backgroundColor'],
                          child: Icon(
                            Icons.person_add_alt_1,
                            color: Colors.white,
                            size: 20,
                          ),
                          tooltip: 'Add Friends',
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardContent(Map<String, dynamic> ticket, bool isExpanded) {
    switch (ticket['type']) {
      case 'travel':
        return _buildTravelTicket(ticket, isExpanded);
      case 'membership':
        return _buildMembershipCard(ticket, isExpanded);
      case 'event':
        return _buildEventTicket(ticket, isExpanded);
      default:
        return Container();
    }
  }

  Widget _buildTravelTicket(Map<String, dynamic> ticket, bool isExpanded) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      ticket['logoPath'],
                      width: 36,
                      height: 36,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Text(
                ticket['company'],
                style: TextStyle(
                  color: ticket['textColor'],
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              // Avatar degli amici che partecipano al viaggio (solo per il biglietto aereo)
              if (ticket['type'] == 'travel')
                Row(
                  children: [
                    _buildFriendAvatar('assets/mostro4_profilo.png',Colors.yellow),
                    Transform.translate(
                      offset: Offset(-10, 0),
                      child: _buildFriendAvatar('assets/mostro2_profilo.png',Colors.pink),
                    ),
                  ],
                ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ticket['from'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ticket['fromCity'],
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.flight, color: ticket['backgroundColor']),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ticket['to'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ticket['toCity'],
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (isExpanded) ...[
                      SizedBox(height: 20),
                      Divider(color: Colors.grey[300]),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoColumn('Date', ticket['date']),
                          _buildInfoColumn('Time', ticket['time']),
                          _buildInfoColumn('Flight', ticket['flightNumber']),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoColumn('Gate', ticket['gate']),
                          _buildInfoColumn('Seat', ticket['seat']),
                          _buildInfoColumn('Class', 'Economy'),
                        ],
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.qr_code_2,
                            size: 80,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 40), // Extra padding for the floating button
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMembershipCard(Map<String, dynamic> ticket, bool isExpanded) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      ticket['logoPath'],
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Text(
                ticket['company'],
                style: TextStyle(
                  color: ticket['textColor'],
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  ticket['memberLevel'],
                  style: TextStyle(
                    color: ticket['backgroundColor'],
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: isExpanded 
              ? Column(
                  children: [
                    // Info section
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ticket['memberName'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            ticket['membershipType'],
                            style: TextStyle(
                              color: ticket['backgroundColor'],
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(Icons.credit_card, size: 16, color: Colors.grey[600]),
                              SizedBox(width: 5),
                              Text(
                                'Card Number: ${ticket["membershipNumber"]}',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                              SizedBox(width: 5),
                              Text(
                                'Valid until: ${ticket["validUntil"]}',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // QR Code section
                    Expanded(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 0),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.qr_code_2,
                            size: 80,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    // Button section
                    Container(
                      padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.event_available),
                        label: Text('Book a Class'),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ticket['backgroundColor'],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Extra padding for the floating button
                  ],
                )
              : Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticket['memberName'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        ticket['membershipType'],
                        style: TextStyle(
                          color: ticket['backgroundColor'],
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(Icons.credit_card, size: 16, color: Colors.grey[600]),
                          SizedBox(width: 5),
                          Text(
                            'Card Number: ${ticket["membershipNumber"]}',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                          SizedBox(width: 5),
                          Text(
                            'Valid until: ${ticket["validUntil"]}',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildEventTicket(Map<String, dynamic> ticket, bool isExpanded) {
    return Column(
      children: [
        // Header section
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      ticket['logoPath'],
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Text(
                ticket['company'],
                style: TextStyle(
                  color: ticket['textColor'],
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              // Avatar degli amici che partecipano all'evento
              _buildFriendAvatar('assets/mostro3_profilo.png',Colors.lightBlue),
            ],
          ),
        ),
        // Main content
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: !isExpanded
              // Contenuto quando la tessera è CHIUSA
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ticket['eventName'],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
                          SizedBox(width: 5),
                          Text(
                            '${ticket["date"]} - ${ticket["time"]}',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                          SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              ticket['location'],
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              // Contenuto quando la tessera è APERTA
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      // Info section
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ticket['eventName'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                                SizedBox(width: 5),
                                Text(
                                  '${ticket["date"]} - ${ticket["time"]}',
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                                SizedBox(width: 5),
                                Text(
                                  ticket['location'],
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey[300]),
                      // Seat details
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SEAT DETAILS',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              ticket['seat'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // QR code con margini sufficienti
                      Container(
                        margin: EdgeInsets.only(top: 40, bottom: 60), // Extra bottom margin for FAB
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.qr_code_2,
                          size: 90,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // AppBar con titolo centrato
      appBar: AppBar(
        title: Text(
          'Your Tickets',
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
            ),
          ),
        ],
        backgroundColor: virginRed,
        elevation: 2,
        centerTitle: true, // Imposta il titolo al centro
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        automaticallyImplyLeading: true,
      ),
      // Il corpo dell'app con lo stack dei biglietti
      body: Stack(
        children: [
          // Stack dei ticket
          Container(
            color: Colors.grey[100],
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: List.generate(tickets.length, (index) {
                      return _buildCard(index, tickets[index]);
                    }),
                  ),
                ),
              ],
            ),
          ),
          
          // Pulsante + sul lato destro
          Positioned(
            right: 20,
            bottom: 20, // Posizionato appena sopra la navbar
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: virginRed,
              child: Icon(Icons.add, color: Colors.white),
              heroTag: "addTicket", // Per evitare conflitti con altri FAB
              tooltip: 'Add Ticket',
            ),
          ),
        ],
      ),
    );
  }
}