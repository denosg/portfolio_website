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

  int visibleStartIndex = 0; // Starting index of visible photos
  int visibleEndIndex = 3; // Ending index of visible photos

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Row(
        children: [
          CarouselSlider.builder(
            itemCount: projectPhotoLists.length,
            options: CarouselOptions(
              enableInfiniteScroll: false,
              viewportFraction: 1.0,
              onPageChanged: (index, _) {
                setState(() {
                  visibleStartIndex = index;
                  visibleEndIndex = index + 3;
                });
              },
            ),
            itemBuilder: (context, index, _) {
              return Opacity(
                opacity:
                    (index >= visibleStartIndex && index <= visibleEndIndex)
                        ? 1.0
                        : 0.0,
                child: ProjectWidget(photoList: projectPhotoLists[index]),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_left),
                onPressed: () {
                  if (visibleStartIndex > 0) {
                    setState(() {
                      visibleStartIndex--;
                      visibleEndIndex--;
                    });
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_right),
                onPressed: () {
                  if (visibleEndIndex < projectPhotoLists.length - 1) {
                    setState(() {
                      visibleStartIndex++;
                      visibleEndIndex++;
                    });
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<List<String>> projectPhotoLists = [
    calcSumList,
    questRealmList,
    fakeLocList,
    beyondFirstList,
  ];
}
