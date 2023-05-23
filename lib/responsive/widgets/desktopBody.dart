import 'package:flutter/material.dart';
import 'package:portfolio_website/app_bar_section/app_button.dart';
import 'package:portfolio_website/widgets/about_widget.dart';
import 'package:portfolio_website/widgets/fading_text_animation.dart';
import 'package:portfolio_website/widgets/personal_projects_widget.dart';
import '/widgets/info_widget.dart';

class DesktopBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const AppButton(scrollTo: null, text: 'Home'),
          const AppButton(scrollTo: null, text: 'About'),
          const AppButton(scrollTo: null, text: 'Projects'),
          const AppButton(scrollTo: null, text: 'Resume'),
        ],
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
                  InfoWidget(),
                  // Image with me
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'pozaCuMnLow.jpg',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              const Center(
                child: FadingTextAnimation(
                    text: "Anything is easy if you do what has to be done."),
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
              AboutWidget(),
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
                child: PersonalProjects(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
