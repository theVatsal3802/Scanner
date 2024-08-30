import 'package:flutter/material.dart';
import 'package:scanner/functions/result_functions.dart';
import 'package:scanner/screens/home_screen.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = "/results";
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Scan result",
          textScaler: TextScaler.noScaling,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(
              data,
              textScaler: TextScaler.noScaling,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                if (ResultFunctions.isUrl(data)) {
                  await ResultFunctions.launchMyUrl(data);
                } else {
                  await ResultFunctions.copyToClipboard(data);
                }
              },
              child: Text(
                ResultFunctions.isUrl(data) ? "Open link" : "Copy to clipboard",
                textScaler: TextScaler.noScaling,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  HomeScreen.routeName,
                  (_) {
                    return false;
                  },
                );
              },
              child: const Text(
                "Open Scanner",
                textScaler: TextScaler.noScaling,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
