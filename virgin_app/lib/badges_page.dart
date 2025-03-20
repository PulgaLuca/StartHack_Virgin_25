import 'package:flutter/material.dart';
import 'qr_scanner_page.dart';

class BadgesPage extends StatefulWidget {
  @override
  _BadgesPageState createState() => _BadgesPageState();
}

class _BadgesPageState extends State<BadgesPage> {
  List<String> badgeImages = List.generate(18, (index) => 'assets/badge_1.png');

  // Function to update image at specific index
  void updateImage(int index, String newImagePath) {
    setState(() {
      badgeImages[index] = newImagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Badges'),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: GridView.builder(
              padding: EdgeInsets.only(bottom: 80), // Prevents button from covering the last row
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 columns
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: badgeImages.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      badgeImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),

          Positioned(
            bottom: 35,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                child: Text('Scan QR Code'),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => QrCodeScanner(
                      onQrCodeScan: (scannedCode) {
                        for (int i = 0; i < badgeImages.length; i++) {
                          if (scannedCode == 'badge_1.png') {
                            updateImage(i, 'assets/badge_2.png'); // Replace with your new image
                            break;
                          }
                        }
                      },
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
