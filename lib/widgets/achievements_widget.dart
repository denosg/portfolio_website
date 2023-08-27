import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/models/achievement.dart';
import 'package:portfolio_website/providers/photo_list.dart';
import 'package:portfolio_website/widgets/achievement_widget.dart';

class AchievementsWidget extends StatefulWidget {
  final bool isForDesk;
  const AchievementsWidget({super.key, required this.isForDesk});

  @override
  State<AchievementsWidget> createState() => _AchievementsWidgetState();
}

class _AchievementsWidgetState extends State<AchievementsWidget> {
  final controller = CarouselController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    List<Achievement> achievements;

    if (widget.isForDesk) {
      achievements = achievementsDesk;
    } else {
      achievements = achievementsPhone;
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        if (achievements.length != 1)
          Positioned(
            left: deviceSize.width * 0.05,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                controller.previousPage();
              },
            ),
          ),
        Center(
          child: SizedBox(
            width: deviceSize.width * 0.8,
            height: widget.isForDesk
                ? deviceSize.height * 0.6
                : deviceSize.height * 0.4,
            child: CarouselSlider.builder(
              carouselController: controller,
              itemBuilder: (context, index, realIndex) {
                final achievement = achievements[index];
                return SizedBox(
                  child: AchievementWidget(
                    isForDesk: widget.isForDesk,
                    title: achievement.title,
                    photoUrls: achievement.photoUrl,
                    url: achievement.url,
                  ),
                );
              },
              itemCount: achievements.length,
              options: CarouselOptions(
                height: widget.isForDesk
                    ? deviceSize.height * 0.5
                    : deviceSize.height * 0.4,
                enlargeCenterPage: false,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
        if (achievements.length != 1)
          Positioned(
            right: deviceSize.width * 0.05,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                controller.nextPage();
              },
            ),
          ),
      ],
    );
  }
}

List<Achievement> achievementsDesk = [
  Achievement(
    title: "1st Place County Phase TIC Olympiad",
    url:
        "https://drive.google.com/file/d/1_4_mLNrou-OkadUSMoVLP3WdX4GkMowy/view?usp=sharing",
    photoUrl: [ticOlympiad],
  ),
  Achievement(
    title:
        "1st Place in County Hackathon for Take Care App - An app connecting people needing services like medical assistance and shopping with specialized and non-specialized young people who can offer support. Advanced to semifinals in Bucharest.",
    url:
        "https://m.ebihoreanul.ro/stiri/trei-echipe-de-la-universitatea-din-oradea-remarcate-la-un-concurs-important-de-inovatie-ce-aplicatii-au-propus-177865.html?fbclid=IwAR22iI0b9CfiKA1mWRGf6szdgio1QjQEZL0jU3tCXa0fpZ3CNY_dITouQAw",
    photoUrl: hackathonTakeCare,
  ),
];

List<Achievement> achievementsPhone = [
  Achievement(
    title: "1st Place County Phase TIC Olympiad",
    url:
        "https://drive.google.com/file/d/1_4_mLNrou-OkadUSMoVLP3WdX4GkMowy/view?usp=sharing",
    photoUrl: [ticOlympiad],
  ),
  Achievement(
    title:
        "1st Place in County Hackathon for Take Care App. Advanced to semifinals in Bucharest.",
    url:
        "https://m.ebihoreanul.ro/stiri/trei-echipe-de-la-universitatea-din-oradea-remarcate-la-un-concurs-important-de-inovatie-ce-aplicatii-au-propus-177865.html?fbclid=IwAR22iI0b9CfiKA1mWRGf6szdgio1QjQEZL0jU3tCXa0fpZ3CNY_dITouQAw",
    photoUrl: [hackathonTakeCare[0]],
  ),
];
