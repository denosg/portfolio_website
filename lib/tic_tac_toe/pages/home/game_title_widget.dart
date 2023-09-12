import 'package:flutter/material.dart';

import '../../widgets/title_circle_widget.dart';
import '../../widgets/title_cross_widget.dart';

class GameTitleWidget extends StatelessWidget {
  const GameTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Tic Tac Toe",
          style: TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 54.0,
              height: 54.0,
              child: TitleCrossWidget(
                strokeWidth: 18.0,
              ),
            ),
            SizedBox(
              width: 24.0,
            ),
            SizedBox(
              width: 54.0,
              height: 54.0,
              child: TitleCircleWidget(
                strokeWidth: 16.0,
              ),
            ),
          ],
        )
      ],
    );
  }
}
