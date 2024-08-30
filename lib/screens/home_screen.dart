import 'package:flutter/material.dart';
import 'package:scanner/functions/scanner_functions.dart';
import 'package:scanner/screens/result_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Scanner",
          textScaler: TextScaler.noScaling,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await ScannerFunctions.scanQrCode().then(
                  (value) {
                    if (value == "-1") {
                      return;
                    }
                    Navigator.of(context).pushNamed(
                      ResultScreen.routeName,
                      arguments: value,
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: const Text(
                "Scan a QR code",
                textScaler: TextScaler.noScaling,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await ScannerFunctions.scanBarcode().then(
                  (value) {
                    if (value == "-1") {
                      return;
                    }
                    Navigator.of(context).pushNamed(
                      ResultScreen.routeName,
                      arguments: value,
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: const Text(
                "Scan barcode",
                textScaler: TextScaler.noScaling,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
