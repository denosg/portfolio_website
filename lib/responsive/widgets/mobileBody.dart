import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/mobile/info_widget_mobile.dart';
import 'package:portfolio_website/widgets/mobile/personal_projects_mobile.dart';
import 'package:portfolio_website/widgets/mobile/social_links.dart';
import '../../widgets/about_widget.dart';
import '../../widgets/fading_text_animation.dart';
import '../../widgets/roulette.dart';
import '/widgets/mobile/custom_drawer.dart';

class MobileBody extends StatelessWidget {
  var homeKey = GlobalKey();
  var aboutKey = GlobalKey();
  var projectsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: CustomDrawer(
          homeKey: homeKey, aboutKey: aboutKey, projectsKey: projectsKey),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Welcome to my portfolio!",
                        style: TextStyle(fontSize: 20)),
                    const SizedBox(width: 5),
                    Image.network(
                        'https://i.ibb.co/tMcyKSG/hello-hand-emoji-web.webp',
                        width: 30,
                        height: 30),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // info column
                  InfoWidgetMobile(key: homeKey),
                  // Image with me
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        'https://i.ibb.co/Hhnmr8X/poza-Cu-Mn-Low-WEB.webp',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              const Center(
                child: FadingTextAnimation(
                    text: "Anything is easy if you do what has to be done.",
                    fontSize: 18),
              ),
              const SizedBox(height: 35),
              // about me section
              const Center(
                child: Text(
                  'About me',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              //TODO: make it so the user can press to load or not
              AboutWidget(key: aboutKey),
              const SizedBox(height: 35),
              // personal projects section
              const Center(
                child: Text(
                  'Personal projects',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 300,
                child: PersonalProjectsMobile(key: projectsKey),
              ),
              const SizedBox(height: 35),
              // ROULETTEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
              const Center(
                child: Text(
                  'Something cool',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const RouletteScreen(fontSize: 18),
              const SizedBox(height: 20),
              // social links
              const SocialLinks(),
            ],
          ),
        ),
      ),
    );
  }
}
