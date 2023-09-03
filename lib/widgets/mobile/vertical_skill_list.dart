import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/desktop/horizontal_skill_list.dart';
import 'package:portfolio_website/widgets/skill_widget.dart';

class VerticalSkillList extends StatelessWidget {
  const VerticalSkillList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 350,
      child: Center(
        child: GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
          ),
          children:
              skillList.map((skill) => SkillWidget(skill: skill)).toList(),
        ),
      ),
    );
  }
}
