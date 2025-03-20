import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  final MobileScannerController controller = MobileScannerController();
  bool _hasScanned = false; // Flag to track if a code has been scanned

  @override
  void dispose() {
    controller.dispose(); // Dispose controller when leaving the screen
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_hasScanned) return; // Prevent multiple scans

    final List<Barcode> barcodes = capture.barcodes;
    final String? scannedValue = barcodes.isNotEmpty ? barcodes.first.rawValue : null;

    if (scannedValue != null) {
      setState(() {
        _hasScanned = true; // Set flag to prevent further scans
      });

      controller.stop(); // Stop scanning

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('QR Code Detected'),
          content: Text(scannedValue),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                Navigator.pop(context); // Go back to the previous page
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Code Scanner"), backgroundColor: Colors.red),
      body: MobileScanner(
        controller: controller,
        onDetect: _onDetect,
      ),
    );
  }
}
