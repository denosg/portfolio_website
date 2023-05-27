import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          " I'm a mobile app enthusiast who's always had a passion for developing apps. I started with Android app development, starting with simple button interfaces with a good backend, before progressing to using dependencies and web scraping to enhance the functionality of my apps. As I continued on this journey, I became fascinated with cross-platform mobile development, which led me to learn the Flutter SDK. With Flutter, I've been able to create stunning UIs for a range of apps, from simple expense planners to full-on shops. I've also been fortunate enough to participate in several competitions, earning 1st Place County Phase TIC Olympiad award. Despite my achievements, I'm still learning a lot about cross-platform mobile development, and the journey is an ongoing adventure as I discover new ways to build beautiful and functional apps. I can't wait to see where this passion takes me next!",
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
