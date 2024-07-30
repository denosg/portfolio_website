import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/providers/photo_list.dart';
import 'package:portfolio_website/widgets/achievements_widget.dart';
import 'package:portfolio_website/widgets/footer.dart';
import 'package:portfolio_website/widgets/mobile/info_widget_mobile.dart';
import 'package:portfolio_website/widgets/mobile/personal_projects_mobile.dart';
import 'package:portfolio_website/widgets/mobile/social_links.dart';
import 'package:portfolio_website/widgets/mobile/vertical_skill_list.dart';
import 'package:portfolio_website/widgets/mobile/work_exp_carousel_m.dart';
import '../../widgets/about_widget.dart';
import '../../widgets/fading_text_animation.dart';
import '../../widgets/mobile/games_screen_mob.dart';
import '/widgets/mobile/custom_drawer.dart';

class MobileBody extends StatelessWidget {
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final achievementsKey = GlobalKey();
  final workExpKey = GlobalKey();

  MobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: CustomDrawer(
        homeKey: homeKey,
        aboutKey: aboutKey,
        projectsKey: projectsKey,
        achievementsKey: achievementsKey,
        workExpKey: workExpKey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome to my portfolio!",
                        key: homeKey, style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 5),
                    CachedNetworkImage(
                        imageUrl: helloHandImgUrl, width: 30, height: 30),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // info column
                    const InfoWidgetMobile(),
                    // Image with me
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          imageUrl: pozaCuMnLowUrl,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: FadingTextAnimation(
                      text: "Anything is easy if you do what has to be done.",
                      fontSize: 18),
                ),
              ),
              const SizedBox(height: 35),
              // about me section
              Center(
                child: Text(
                  'About me',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  key: aboutKey,
                ),
              ),
              const SizedBox(height: 15),
              const AboutWidget(isDesk: false),
              const SizedBox(height: 35),
              // skills section
              const Center(
                child: Text(
                  'Skills',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              const VerticalSkillList(),
              const SizedBox(height: 35),
              // work experience section
              Center(
                child: Text(
                  'WorkExperience',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  key: workExpKey,
                ),
              ),
              const SizedBox(height: 15),
              const WorkExpCarouselMob(),
              // achievements section
              Center(
                child: Text(
                  'Achievements',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  key: achievementsKey,
                ),
              ),
              const SizedBox(height: 15),
              const AchievementsWidget(isForDesk: false),
              const SizedBox(height: 35),
              // personal projects section
              Center(
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
                child: PersonalProjectsMobile(),
              ),
              const SizedBox(height: 35),
              // ROULETTEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
              const Center(
                child: Text(
                  'Something cool',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const GamesScreenMob(),
              const SizedBox(height: 20),
              // social links
              const SocialLinks(),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
