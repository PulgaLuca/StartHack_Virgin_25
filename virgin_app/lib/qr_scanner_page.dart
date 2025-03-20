import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScanner extends StatelessWidget {
  final Function(String) onQrCodeScan;

  QrCodeScanner({super.key, required this.onQrCodeScan});

  final MobileScannerController controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: controller,
      onDetect: (BarcodeCapture capture) {
        final List<Barcode> barcodes = capture.barcodes;

        for (final barcode in barcodes) {
          // Pass the barcode raw value to the callback function
          onQrCodeScan(barcode.rawValue ?? '');

          // Use Future.delayed to ensure context is stable before navigating
          Future.delayed(Duration.zero, () {
            Navigator.pop(context); // Ensure this happens after the frame is rendered
          });
        }
      },
    );
  }
}
