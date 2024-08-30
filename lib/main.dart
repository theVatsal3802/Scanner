import 'package:flutter/material.dart';
import 'package:scanner/screens/home_screen.dart';
import 'package:scanner/screens/result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scanner',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        ResultScreen.routeName: (context) => const ResultScreen(),
      },
    );
  }
}
