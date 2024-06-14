import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('QR Code Generator'),
        ),
        body: Center(
          child: QrCodeGenerator(),
        ),
      ),
    );
  }
}

class QrCodeGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String qrData = "https://pay.google.com"; // The data you want to encode

    try {
      return Center(
        child: QrImageView(
          key: ValueKey(qrData),
          data: qrData,
          version: QrVersions.auto,
          size: 200.0,
          gapless: false,
          embeddedImage: AssetImage('assets/images.png'), // Optional: Add an embedded image like Google Pay logo
          embeddedImageStyle: QrEmbeddedImageStyle(
            size: Size(40, 40),
          ),
        ),
      );
    } catch (e) {
      return Center(
        child: Text('Error generating QR code: $e'),
      );
    }

  }
}

