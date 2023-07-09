import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';

import 'package:portfolio_website/providers/photo_list.dart';
import 'package:portfolio_website/widgets/project_widget.dart';

class PersonalProjects extends StatefulWidget {
  const PersonalProjects({super.key});

  @override
  State<PersonalProjects> createState() => _PersonalProjectsState();
}

class _PersonalProjectsState extends State<PersonalProjects> {
  final controller = CarouselController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 100,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              controller.previousPage();
            },
          ),
        ),
        CarouselSlider.builder(
          carouselController: controller,
          options: CarouselOptions(
            aspectRatio: 2.5,
            enlargeCenterPage: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentPageIndex = index;
              });
            },
          ),
          itemCount: (projectPhotoLists.length / 2).round(),
          itemBuilder: (context, index, realIdx) {
            final int first = index * 2;
            final int second = first + 1;
            return Row(
              children: [first, second].map((idx) {
                return Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: ProjectWidget(
                      titleSize: 20,
                      descriptionSize: 12,
                      photoList: projectPhotoLists[idx],
                      title: projectTitle[idx],
                      description: projectDesc[idx],
                      url: projectUrl[idx],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
        Positioned(
          right: 100,
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

  List<List<String>> projectPhotoLists = [
    calcSumList,
    questRealmList,
    fakeLocList,
    beyondFirstList,
  ];

  List<String> projectTitle = [
    titleCalc,
    titleQuest,
    titleFakeLoc,
    titleBeyond,
  ];

  List<String> projectDesc = [
    descCalc,
    descQuest,
    descFakeLoc,
    descBeyond,
  ];

  List<String> projectUrl = [
    urlCalc,
    urlQuest,
    urlFakeLoc,
    urlBeyond,
  ];
}
