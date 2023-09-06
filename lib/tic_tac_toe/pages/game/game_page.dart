import 'package:flutter/material.dart';

import '../../controller/game_controller.dart';
import 'board_widget.dart';
import 'current_player_widget.dart';
import 'game_action_widget.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GameController(false);

    final deviceSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BoardWidget(
          size: deviceSize.width > 600
              ? deviceSize.height * 0.4
              : deviceSize.height * 0.28,
          controller: controller,
        ),
        CurrentPlayerWidget(controller: controller),
        SizedBox(
            height: deviceSize.height * 0.08,
            child: GameActionWidget(controller: controller)),
      ],
    );
  }
}
