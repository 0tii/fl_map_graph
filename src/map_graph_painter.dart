import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class DictGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const pointMode = ui.PointMode.points;
    const points = [
      Offset(50, 100),
      Offset(270, 100),
    ];
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(pointMode, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    //todo check if data changed or display mode
    return false;
  }
}
