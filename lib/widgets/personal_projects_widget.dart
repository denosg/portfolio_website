import 'package:flutter/material.dart';
import 'package:portfolio_website/providers/calculator_consum_provider.dart';
import 'package:portfolio_website/providers/quest_realm_provider.dart';
import 'package:portfolio_website/widgets/project_widget.dart';

class PersonalProjects extends StatelessWidget {
  final calcSumList = CalculatorConsumProvider().photoList;
  final questRealmList = QuestRealmProvider().photoList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        ProjectWidget(photoList: calcSumList),
        ProjectWidget(photoList: questRealmList),
      ],
    );
  }
}
