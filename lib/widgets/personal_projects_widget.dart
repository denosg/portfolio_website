import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:portfolio_website/providers/photo_list.dart';
import 'package:portfolio_website/widgets/project_widget.dart';

// TODO: add description to apps

class PersonalProjects extends StatefulWidget {
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
        CarouselSlider.builder(
          carouselController: controller,
          options: CarouselOptions(
            aspectRatio: 2.0,
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
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ProjectWidget(photoList: projectPhotoLists[idx]),
                  ),
                );
              }).toList(),
            );
          },
        ),
        Positioned(
          left: 60,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              controller.previousPage();
            },
          ),
        ),
        Positioned(
          right: 60,
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
}
