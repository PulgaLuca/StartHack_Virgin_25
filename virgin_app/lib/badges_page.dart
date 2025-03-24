import 'package:flutter/material.dart';
import 'aes_helper.dart';
import 'qr_scanner_page.dart';
import 'widgets/avatar_widget.dart';

class BadgesPage extends StatefulWidget {
  @override
  _BadgesPageState createState() => _BadgesPageState();
}


class _BadgesPageState extends State<BadgesPage> {
  final Color virginRed = Color(0xFFE50914);
  List<String> badgeImages = List.generate(6, (index) => 'assets/badge_${index+1}.png');

  void updateImage(int index, String newImagePath) {
    if (!mounted) return; // Prevent updating if widget is unmounted
    setState(() {
      badgeImages[index] = newImagePath;
    });
  }

  void _scanQRCode(BuildContext context) async {
    final scannedCode = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QrCodeScanner()),
    );

    if (scannedCode != null) {
      for (int i = 0; i < badgeImages.length; i++) {
        if (AESHelper.decrypt(scannedCode) == 'badge_${i+1}.png') {
          // print('Scanning: $scannedCode');
          // print('Updating to: assets/badge_${i+1}_taken.png');
          updateImage(i, 'assets/badge_${i+1}_taken.png'); // Replace with your new image
          break;
        }
      }
    } else {
      print("No QR code scanned.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Badges',
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
            ),
          ),
        ],
        backgroundColor: virginRed,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: GridView.builder(
              padding: EdgeInsets.only(bottom: 80), // Prevents button from covering the last row
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
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
                onPressed: () => _scanQRCode(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: virginRed,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Scan QR Code',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
