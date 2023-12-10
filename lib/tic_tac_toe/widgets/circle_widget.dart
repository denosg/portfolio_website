import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/ui_constants.dart';

class CircleWidget extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  const CircleWidget({
    super.key,
    this.color = circleWidgetColor,
    this.strokeWidth = widgetStrokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return CustomPaint(
      painter: _CirclePainter(
        color: color,
        strokeWidth: strokeWidth,
        deviceSize: deviceSize,
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final Size deviceSize;

  _CirclePainter(
      {required this.color,
      required this.strokeWidth,
      required this.deviceSize});

  @override
  void paint(Canvas canvas, Size size) {
    final isMobile = deviceSize.width < 600;

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = isMobile ? 18.0 : min(centerX, centerY);

    canvas.drawCircle(
        center,
        radius,
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
