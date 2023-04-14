import 'package:flutter/material.dart';
import 'package:google_translator/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Translator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // appBarTheme: const AppBarTheme(backgroundColor: Colors.black54),
        colorScheme: const ColorScheme.dark()
      ),
      home: const HomeScreen(),
    );
  }
}

