import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_website/models/skill.dart';

class SkillWidget extends StatelessWidget {
  final Skill skill;

  const SkillWidget({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      width: deviceSize.width * 0.12,
      child: Row(
        children: [
          CachedNetworkImage(imageUrl: skill.photoUrl, height: 48),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              skill.skillName,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
