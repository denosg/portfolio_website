import 'package:flutter/material.dart';
import 'package:portfolio_website/models/skill.dart';
import 'package:portfolio_website/providers/photo_list.dart';
import 'package:portfolio_website/widgets/skill_widget.dart';

class HorizontalSkillList extends StatelessWidget {
  const HorizontalSkillList({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SizedBox(
      height: deviceSize.height * 0.12,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              skillList.map((skill) => SkillWidget(skill: skill)).toList()),
    );
  }
}

List<Skill> skillList = [
  Skill(skillName: "Flutter", photoUrl: flutterUrl),
  Skill(skillName: "NodeJS", photoUrl: nodeJsUrl),
  Skill(skillName: "Firebase", photoUrl: firebaseUrl),
  Skill(skillName: "ASP.NET Core", photoUrl: aspNetCore),
  Skill(skillName: "Android", photoUrl: androidUrl),
  Skill(skillName: "SqLite", photoUrl: sqlUrl),
  Skill(skillName: "NoSql", photoUrl: noSqlUrl),
];
