import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import './homepage.dart';

// TODO: move project to FLutter 3.13.9
// ALWAYS USE CANVASKIT FOR RENDER: flutter build web --web-renderer canvaskit --release
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
        useMaterial3: false,
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
