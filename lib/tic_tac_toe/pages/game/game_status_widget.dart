import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../controller/game_controller.dart';
import '../../widgets/circle_widget.dart';
import '../../widgets/cross_widget.dart';

class GameStatusWidget extends StatelessWidget {
  final GameController controller;
  const GameStatusWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const SizedBox(
              width: 30.0,
              height: 30.0,
              child: CrossWidget(
                strokeWidth: 8.0,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Obx(() => Text(
                  "${controller.player1Win} Wins",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              width: 30.0,
              height: 30.0,
              child: CircleWidget(),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Obx(() => Text(
                  "${controller.player2Win} Wins",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
        Column(
          children: [
            const Icon(
              Icons.balance,
              size: 34.0,
              color: Colors.black45,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Obx(() => Text(
                  "${controller.draw} Draws",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
