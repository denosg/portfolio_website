import 'package:flutter/material.dart';

import '../constants/ui_constants.dart';

class CrossWidget extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  const CrossWidget({
    super.key,
    this.color = crossWidgetColor,
    this.strokeWidth = widgetStrokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return CustomPaint(
      painter: _CrossPainter(
          color: color, strokeWidth: strokeWidth, deviceSize: deviceSize),
    );
  }
}

class _CrossPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final Size deviceSize;

  _CrossPainter({
    required this.color,
    required this.strokeWidth,
    required this.deviceSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    final isMobile = deviceSize.width < 600;

    final goodOffset =
        isMobile ? const Offset(0.0, 20) : Offset(0.0, size.height);
    final goodOffset2 =
        isMobile ? const Offset(20, 0.0) : Offset(size.width, 0.0);
    final goodOffset3 =
        isMobile ? const Offset(20, 20) : Offset(size.width, size.height);

    canvas.drawLine(
      goodOffset,
      goodOffset2,
      painter,
    );

    canvas.drawLine(
      goodOffset3,
      const Offset(0.0, 0.0),
      painter,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
