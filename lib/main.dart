import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/providers/story_screen_prov.dart';

// ALWAYS USE CANVASKIT FOR RENDER: flutter build web --web-renderer canvaskit --release
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screen = ref.watch(storyScreenProv);

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
      home: screen,
    );
  }
}
