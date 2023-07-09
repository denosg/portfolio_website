// ignore: file_names
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url;
import 'package:portfolio_website/app_bar_section/app_button.dart';
import 'package:portfolio_website/widgets/about_widget.dart';
import 'package:portfolio_website/widgets/fading_text_animation.dart';
import 'package:portfolio_website/widgets/personal_projects_widget.dart';
import 'package:portfolio_website/widgets/roulette.dart';
import '/widgets/info_widget.dart';

// ignore: must_be_immutable
class DesktopBody extends StatelessWidget {
  var homeKey = GlobalKey();
  var aboutKey = GlobalKey();
  var projectsKey = GlobalKey();

  DesktopBody({super.key});

  void downloadResume() async {
    final resumeUrl = Uri.parse(
        'https://github.com/denosg/resume-host/blob/main/CV%20Denis%20Costelas.pdf');

    if (await url.canLaunchUrl(resumeUrl)) {
      await url.launchUrl(resumeUrl);
    } else {
      throw 'Could not launch $resumeUrl';
    }
  }

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(scrollTo: () => scrollTo(homeKey), text: 'Home'),
            AppButton(scrollTo: () => scrollTo(aboutKey), text: 'About'),
            AppButton(scrollTo: () => scrollTo(projectsKey), text: 'Projects'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: downloadResume,
                child: const Text('Resume',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // info column
                  InfoWidget(key: homeKey),
                  // Image with me
                  SizedBox(
                    width: 200,
                    height: 200,
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
                    fontSize: 24),
              ),
              const SizedBox(height: 35),
              // about me section
              const Padding(
                padding: EdgeInsets.only(left: 50),
                child: Text(
                  'About me',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              AboutWidget(key: aboutKey),
              const SizedBox(height: 35),
              // personal projects section
              const Padding(
                padding: EdgeInsets.only(left: 50),
                child: Text(
                  'Personal projects',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 300,
                child: PersonalProjects(key: projectsKey),
              ),
              const SizedBox(height: 35),
              // ROULETTEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
              const Padding(
                padding: EdgeInsets.only(left: 50),
                child: Text(
                  'Something cool',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const RouletteScreen(fontSize: 25),
            ],
          ),
        ),
      ),
    );
  }
}
