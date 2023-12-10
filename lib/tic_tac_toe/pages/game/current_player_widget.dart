import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../controller/game_controller.dart';
import '../../game_ai/game_util.dart';
import '../../widgets/circle_widget.dart';
import '../../widgets/cross_widget.dart';

class CurrentPlayerWidget extends StatelessWidget {
  final GameController controller;
  const CurrentPlayerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
          width: 20.0,
          child: Obx(
            () => _getPlayerSymbol(controller.currentPlayer.value),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Obx(
          () => Text(
            controller.currentPlayerMove ?? "",
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }

  Widget _getPlayerSymbol(int playerId) {
    switch (playerId) {
      case GameUtil.playerOne:
        return const CrossWidget(
          strokeWidth: 6.0,
        );
      case GameUtil.playerTwo:
        return const CircleWidget(
          strokeWidth: 6.0,
        );
      default:
        throw ArgumentError("Unknow playerId");
    }
  }
}
