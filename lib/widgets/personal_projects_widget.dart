import 'package:flutter/material.dart';
import 'package:portfolio_website/providers/photo_list.dart';
import 'package:portfolio_website/widgets/project_widget.dart';

class PersonalProjects extends StatefulWidget {
  @override
  State<PersonalProjects> createState() => _PersonalProjectsState();
}

class _PersonalProjectsState extends State<PersonalProjects>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Stack(children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ProjectWidget(photoList: calcSumList),
              ProjectWidget(photoList: questRealmList),
              ProjectWidget(photoList: fakeLocList),
              ProjectWidget(photoList: beyondFirstList),
            ],
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          child: IconButton(
            icon: const Icon(Icons.arrow_left),
            onPressed: null,
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.arrow_right),
            onPressed: null,
          ),
        ),
      ]),
    );
  }
}
