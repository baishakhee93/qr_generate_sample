import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generate_sample/main.dart';


void main() {
  testWidgets('QR Code Generator shows QR code', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(MyApp());

    // Verify the QR code is displayed
    expect(find.byType(QrImageView), findsOneWidget);
  });

  testWidgets('QR Code Generator generates QR code without errors', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(MyApp());

    // Find the QR code widget
    final qrCodeFinder = find.byType(QrImageView);

    // Verify the QR code widget exists
    expect(qrCodeFinder, findsOneWidget);

    // Verify the widget data through a key
    final qrCodeWidget = tester.widget<QrImageView>(qrCodeFinder);
    expect(qrCodeWidget.key, ValueKey('https://pay.google.com'));
  });
}
