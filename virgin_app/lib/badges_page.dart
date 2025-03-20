import 'package:flutter/material.dart';
import 'package:virgin_app/aes_helper.dart';
import 'qr_scanner_page.dart';

class BadgesPage extends StatefulWidget {
  @override
  _BadgesPageState createState() => _BadgesPageState();
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
              imagePath: 'assets/mostro2_profilo.png',
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
