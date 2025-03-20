import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TicketsPage extends StatefulWidget {
  @override
  _TicketsPageState createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int _selectedCardIndex = -1;
  bool _isCardExpanded = false;
  
  // Definizione dei biglietti (in stile iOS Wallet)
  final List<Map<String, dynamic>> tickets = [
    {
      'type': 'travel',
      'title': 'Partenza e Destinazione',
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
      'fromCity': 'Milano',
      'toCity': 'Londra'
    },
    {
      'type': 'membership',
      'title': 'Accesso Palestra',
      'membershipNumber': '9876543210',
      'validUntil': '15 MAG 2025',
      'backgroundColor': Color(0xFFFF5722),
      'textColor': Colors.white,
      'logoPath': 'assets/virgin_active_logo.png',
      'company': 'Virgin Active',
      'membershipType': 'Abbonamento Premium'
    },
    {
      'type': 'event',
      'title': 'Concerto Live',
      'eventName': 'Live Music Festival',
      'date': '22 GIU',
      'time': '19:30',
      'location': 'Stadio San Siro, Milano',
      'seat': 'Settore B, Fila 10, Posto 45',
      'backgroundColor': Color(0xFF1E88E5),
      'textColor': Colors.white,
      'company': 'TicketOne'
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
        // Chiudi il biglietto
        _isCardExpanded = false;
        _animationController.reverse();
      } else {
        // Apri il biglietto
        _selectedCardIndex = index;
        _isCardExpanded = true;
        _animationController.forward(from: 0.0);
      }
    });
  }

  Widget _buildCard(int index, Map<String, dynamic> ticket) {
    final bool isSelected = _selectedCardIndex == index;
    final double topMargin = isSelected ? 20.0 : 28.0 + (8.0 * (index - _selectedCardIndex).abs());
    final double opacity = isSelected ? 1.0 : (_isCardExpanded ? 0.7 : 1.0);
    
    // Aumentata l'altezza del biglietto espanso per evitare overflow del QR code
    final double cardHeight = isSelected && _isCardExpanded ? 450 : 200;
    
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
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: cardHeight,
            decoration: BoxDecoration(
              color: ticket['backgroundColor'],
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: _buildCardContent(ticket, isSelected && _isCardExpanded),
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
            child: SingleChildScrollView(  // Aggiunto SingleChildScrollView per evitare overflow
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
                          _buildInfoColumn('Data', ticket['date']),
                          _buildInfoColumn('Orario', ticket['time']),
                          _buildInfoColumn('Volo', ticket['flightNumber']),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoColumn('Gate', ticket['gate']),
                          _buildInfoColumn('Posto', ticket['seat']),
                          _buildInfoColumn('Classe', 'Economy'),
                        ],
                      ),
                      SizedBox(height: 30),  // Spazio aggiuntivo per evitare overflow
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
                      SizedBox(height: 20),  // Spazio aggiuntivo in fondo
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
            child: SingleChildScrollView(  // Aggiunto SingleChildScrollView per evitare overflow
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ticket['membershipType'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Numero Tessera: ${ticket["membershipNumber"]}',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Valido fino al: ${ticket["validUntil"]}',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                    if (isExpanded) ...[
                      SizedBox(height: 50),  // Spazio maggiore
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
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ticket['backgroundColor'],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          ),
                          child: Text('Prenota un Corso'),
                        ),
                      ),
                      SizedBox(height: 20),  // Spazio aggiuntivo in fondo
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

  Widget _buildEventTicket(Map<String, dynamic> ticket, bool isExpanded) {
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
                  child: Icon(
                    Icons.music_note,
                    color: ticket['backgroundColor'],
                    size: 24,
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
            child: SingleChildScrollView(  // Aggiunto SingleChildScrollView per evitare overflow
              child: Padding(
                padding: EdgeInsets.all(20.0),
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
                            fontSize: 16,
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
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    if (isExpanded) ...[
                      SizedBox(height: 20),
                      Divider(color: Colors.grey[300]),
                      SizedBox(height: 10),
                      Text(
                        'DETTAGLI POSTO',
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
                      SizedBox(height: 50),  // Spazio maggiore
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
                      SizedBox(height: 20),  // Spazio aggiuntivo in fondo
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
      appBar: AppBar(
        title: Text('Tickets'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,  // Permette al contenuto di estendersi oltre i confini
              children: List.generate(tickets.length, (index) {
                return _buildCard(index, tickets[index]);
              }).reversed.toList(),
            ),
          ),
        ],
      ),
    );
  }
}