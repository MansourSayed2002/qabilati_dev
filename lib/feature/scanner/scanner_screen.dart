import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qabilati/core/enum/type_scan.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key, required this.typeScannerWork});
  final TypeScannerWork typeScannerWork;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        controller: MobileScannerController(),
        onDetect: (result) {
          print(result.barcodes.first.rawValue);
        },
      ),
    );
  }
}
