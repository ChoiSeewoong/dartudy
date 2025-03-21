import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const DartudyApp());
}

class DartudyApp extends StatelessWidget {
  const DartudyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dartudy',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
