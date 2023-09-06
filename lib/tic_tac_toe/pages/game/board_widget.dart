import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../constants/ui_constants.dart';
import '../../controller/game_controller.dart';
import '../../game_ai/game_util.dart';
import '../../widgets/circle_widget.dart';
import '../../widgets/cross_widget.dart';

class BoardWidget extends StatelessWidget {
  final GameController controller;
  final double size;
  const BoardWidget({
    super.key,
    required this.size,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: size,
      height: size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _listenBoardData(),
          _listenAiPlaying(),
          _listenGameResult(),
        ],
      ),
    );
  }

  Widget _listenAiPlaying() {
    return Obx(() => IgnorePointer(
          ignoring: !controller.isAiPlaying.value,
          child: Container(
            color: Colors.transparent,
          ),
        ));
  }

  Widget _listenGameResult() {
    return Obx(
      () => IgnorePointer(
        ignoring: controller.gameResult.value == 0,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          alignment: Alignment.center,
          color: controller.gameResult.value != 0
              ? Colors.grey.withOpacity(0.2)
              : Colors.transparent,
          child: _buildForGameResult(),
        ),
      ),
    );
  }

  Widget? _buildForGameResult() {
    final gameResultStatus = controller.gameResultStatus;
    if (gameResultStatus != null) {
      return Text(
        gameResultStatus,
        style: const TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
        ),
      );
    }
    return null;
  }

  Widget _listenBoardData() {
    return Obx(
      () => GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        childAspectRatio: 1.0,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          controller.board.length,
          (index) => _Field(
            index: index,
            onTap: (idx) {
              controller.move(idx);
            },
            isEnable: controller.isEnable(index),
            playerId: controller.getDataAt(index),
          ),
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final int index;
  final bool isEnable;
  final ValueChanged<int> onTap;
  final int playerId;
  const _Field({
    Key? key,
    required this.index,
    required this.isEnable,
    required this.onTap,
    required this.playerId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnable ? () => onTap(index) : null,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: _getBorder(index + 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _getPlayerWidget(playerId),
        ),
      ),
    );
  }

  Widget? _getPlayerWidget(int playerId) {
    switch (playerId) {
      case GameUtil.playerOne:
        return const CrossWidget();
      case GameUtil.playerTwo:
        return const CircleWidget();
      default:
        return null;
    }
  }

  Border _getBorder(int index) {
    switch (index) {
      case 1:
        return const Border(
            right: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ),
            bottom: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ));
      case 2:
        return const Border(
            left: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ),
            right: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ),
            bottom: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ));
      case 3:
        return const Border(
            left: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ),
            bottom: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ));
      case 4:
        return const Border(
          right: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: borderStyle,
          ),
          top: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: borderStyle,
          ),
          bottom: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: borderStyle,
          ),
        );
      case 5:
        return Border.all(
          color: borderColor,
          width: borderWidth,
          style: borderStyle,
        );
      case 6:
        return const Border(
          left: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: borderStyle,
          ),
          top: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: borderStyle,
          ),
          bottom: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: borderStyle,
          ),
        );
      case 7:
        return const Border(
          right: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: borderStyle,
          ),
          top: BorderSide(
            color: borderColor,
            width: borderWidth,
            style: borderStyle,
          ),
        );
      case 8:
        return const Border(
            left: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ),
            right: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ),
            top: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ));
      case 9:
        return const Border(
            left: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ),
            top: BorderSide(
              color: borderColor,
              width: borderWidth,
              style: borderStyle,
            ));
      default:
        throw ArgumentError('Unknown index : $index');
    }
  }
}
