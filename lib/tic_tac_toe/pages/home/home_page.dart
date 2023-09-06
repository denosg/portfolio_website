import 'package:flutter/material.dart';

import 'game_mode_selection.dart';
import 'game_title_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GameTitleWidget(),
        SizedBox(height: 30),
        GameModeSelectionWidget(),
      ],
    );
  }
}
