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
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ProjectWidget(photoList: calcSumList),
              ProjectWidget(photoList: questRealmList),
              ProjectWidget(photoList: fakeLocList),
              ProjectWidget(photoList: beyondFirstList),
            ],
          )),
    );
  }
}
