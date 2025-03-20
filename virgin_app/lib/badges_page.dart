import 'package:flutter/material.dart';
import 'qr_scanner_page.dart';

class BadgesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Badges'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Scan QR Code'),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => QrCodeScanner(),
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          ),
        ),
      ),
    );
  }
}
