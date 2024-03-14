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
    "  A highly adaptable and disciplined individual, I am passionate about leveraging my technical skills to contribute positively to both my team and the community. With a love for programming deeply ingrained in my work ethic, I find fulfillment in not only excelling in my own tasks but also in assisting and mentoring colleagues to achieve their goals. Known for my sociable and charismatic nature, I thrive in collaborative environments where teamwork and innovation flourish. Eager to continue making meaningful contributions and fostering growth within any project I work on. <3";
const String mobText =
    "  Enthusiastic programmer since middle school, igniting my passion by tweaking video games. Crafted handy apps, showcased science projects, and clinched victories in coding contests while pursuing computer engineering. Thrilled by the creative power of code, I'm driven to continually expand my horizons. Eager to make a meaningful mark through my programming prowess! <3";
