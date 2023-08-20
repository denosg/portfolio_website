import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portfolio_website/models/work_exp.dart';
import 'package:portfolio_website/providers/photo_list.dart';
import 'package:portfolio_website/providers/text_hupu_app.dart';
import 'package:portfolio_website/widgets/desktop/work_experience_projects.dart';

class WorkExpCarousel extends StatefulWidget {
  const WorkExpCarousel({super.key});

  @override
  State<WorkExpCarousel> createState() => _WorkExpCarouselState();
}

class _WorkExpCarouselState extends State<WorkExpCarousel> {
  final controller = CarouselController();
  int currentPageIndex = 0;

  // more apps / experience add here ->
  List<WorkExp> worKExpList = [
    WorkExp(
        companyNameAndApp: "Monad Systems - Hupu app",
        workTime: "july - present",
        linkForApp: "https://apartinator.ro/",
        tasksIveDone: tasksIveDoneHupu,
        appImage: hupuAppImg),
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        if (worKExpList.length != 1)
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
            child: CarouselSlider.builder(
              carouselController: controller,
              itemCount: worKExpList.length,
              itemBuilder: (context, index, realIndex) {
                final workExp = worKExpList[index];
                return WorkExperience(
                    urlForApp: workExp.linkForApp,
                    companyAndApp: workExp.companyNameAndApp,
                    timeSpent: workExp.workTime,
                    tasks: workExp.tasksIveDone,
                    appImg: workExp.appImage);
              },
              options: CarouselOptions(
                height: deviceSize.height * 0.57,
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
        if (worKExpList.length != 1)
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
