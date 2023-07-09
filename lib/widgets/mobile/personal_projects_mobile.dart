import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';

import 'package:portfolio_website/providers/photo_list.dart';
import 'package:portfolio_website/widgets/project_widget.dart';

class PersonalProjectsMobile extends StatefulWidget {
  const PersonalProjectsMobile({Key? key}) : super(key: key);

  @override
  State<PersonalProjectsMobile> createState() => _PersonalProjectsMobileState();
}

class _PersonalProjectsMobileState extends State<PersonalProjectsMobile> {
  final controller = CarouselController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0,
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
            aspectRatio: 1,
            enlargeCenterPage: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentPageIndex = index;
              });
            },
          ),
          itemCount: projectPhotoLists.length,
          itemBuilder: (context, index, realIdx) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ProjectWidget(
                titleSize: 18,
                descriptionSize: 10,
                photoList: projectPhotoLists[index],
                title: projectTitle[index],
                description: projectDesc[index],
                url: projectUrl[index],
              ),
            );
          },
        ),
        Positioned(
          right: 0,
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
