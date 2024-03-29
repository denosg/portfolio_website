import 'package:flutter/material.dart';

import '../constants/ui_constants.dart';

class TitleCrossWidget extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  const TitleCrossWidget({
    super.key,
    this.color = crossWidgetColor,
    this.strokeWidth = widgetStrokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CrossPainter(
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class _CrossPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _CrossPainter({
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas.drawLine(
      Offset(0.0, size.height),
      Offset(size.width, 0.0),
      painter,
    );

    canvas.drawLine(
      Offset(size.width, size.height),
      const Offset(0.0, 0.0),
      painter,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
