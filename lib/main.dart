import 'package:flutter/material.dart';
import 'package:projek_fakhri_rasyad/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Project',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFEF476F))),
      home: const HomePage(),
    );
  }
}
