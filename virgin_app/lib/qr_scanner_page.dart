import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  @override
  _QRCodeScannerState createState() => _QRCodeScannerState();
}

class _QRCodeScannerState extends State<QrCodeScanner> {
  MobileScannerController controller = MobileScannerController();
  bool isScanning = true; // To prevent multiple pops

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Code Scanner")),
      body: MobileScanner(
        controller: controller,
        onDetect: (capture) {
          if (!isScanning) return; // Prevent multiple detections

          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            if (barcode.rawValue != null) {
              isScanning = false; // Stop further detections
              Navigator.pop(context, barcode.rawValue); // Return result
              break;
            }
          }
        },
      ),
    );
  }
}
