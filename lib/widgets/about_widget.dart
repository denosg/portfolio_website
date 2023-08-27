import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  final bool isDesk;
  const AboutWidget({super.key, required this.isDesk});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          isDesk ? deskText : mobText,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}

const String deskText =
    "  Through a passion for programming that began in middle school, I have pursued academic excellence and used my skills to help others. My curiosity was first sparked when I modified a video game as a young teen. Since then, I have created mobile apps to connect generations, presented science projects to my local community, and achieved top honors in computing competitions. While studying computer engineering at university, I continue to learn new skills like cryptography and machine learning. I love bringing ideas to life through code. Whether crafting algorithms or building clean user interfaces, I pour my focus into perfecting every detail. I take pride in using my programming talents, not just for personal projects, but to create technology that gives back. Though my path has had twists and turns, each experience has expanded my perspective and strengthened my resolve to keep learning. I look forward to continuing this journey and using my passion for programming to make a positive impact ! <3";
const String mobText =
    "  My passion for programming began in middle school when I modified a video game. Since then, I have created helpful apps, presented science projects locally, and won computing competitions while studying computer engineering. I love bringing ideas to life through code. My path has expanded my perspective and strengthened my resolve to keep learning. I look forward to making a positive impact through my programming passion ! <3";
