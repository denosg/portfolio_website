import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

import './homepage.dart';

// ALWAYS USE CANVASKIT FOR RENDER: flutter build web --web-renderer canvaskit
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          primary: Colors.blueGrey,
          secondary: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}
