// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/common/utils.dart';
import 'package:portfolio_website/providers/photo_list.dart';
import 'package:portfolio_website/widgets/achievements_widget.dart';
import 'package:portfolio_website/widgets/desktop/horizontal_skill_list.dart';
import 'package:portfolio_website/widgets/desktop/info_widget.dart';
import 'package:portfolio_website/widgets/desktop/personal_projects_widget.dart';
import 'package:portfolio_website/widgets/desktop/work_exp_carousel.dart';
import 'package:portfolio_website/widgets/footer.dart';
import 'package:portfolio_website/app_bar_section/app_button.dart';
import 'package:portfolio_website/widgets/about_widget.dart';
import 'package:portfolio_website/widgets/fading_text_animation.dart';

import '../../widgets/desktop/games_screen.dart';

final showLoading = StateProvider.autoDispose<bool>((ref) => false);

// ignore: must_be_immutable
class DesktopBody extends StatelessWidget {
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final workExperienceKey = GlobalKey();
  final achievementsKey = GlobalKey();

  DesktopBody({super.key});

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
            AppButton(
                scrollTo: () => scrollTo(workExperienceKey),
                text: 'WorkExperience'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                onPressed: downloadResume,
                child: Text('Resume',
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
                      child: CachedNetworkImage(
                        imageUrl: pozaCuMnLowUrl,
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
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  'About me',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  key: aboutKey,
                ),
              ),
              const SizedBox(height: 15),
              const AboutWidget(isDesk: true),
              const SizedBox(height: 35),
              // skills section
              const Padding(
                padding: EdgeInsets.only(left: 50),
                child: Text(
                  'Skills',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              const HorizontalSkillList(),
              const SizedBox(height: 35),
              // work experience section
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  'WorkExperience',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  key: workExperienceKey,
                ),
              ),
              const WorkExpCarousel(),
              const SizedBox(height: 35),
              // achievements section
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  'Achievements',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  key: achievementsKey,
                ),
              ),
              const AchievementsWidget(isForDesk: true),
              const SizedBox(height: 35),
              // personal projects section
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  'Personal projects',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  key: projectsKey,
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 300,
                child: PersonalProjects(),
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
              const GamesScreen(),
              const SizedBox(height: 20),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
