import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:portfolio_website/providers/photo_list.dart';
import 'package:portfolio_website/widgets/project_widget.dart';

class PersonalProjects extends StatefulWidget {
  @override
  State<PersonalProjects> createState() => _PersonalProjectsState();
}

class _PersonalProjectsState extends State<PersonalProjects> {
  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: false,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 1),
        pauseAutoPlayOnTouch: true,
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
    );
  }

  List<List<String>> projectPhotoLists = [
    calcSumList,
    questRealmList,
    fakeLocList,
    beyondFirstList,
  ];
}
