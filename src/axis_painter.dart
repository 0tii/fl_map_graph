import 'package:flutter/rendering.dart';

class AxisPainter extends CustomPainter {
  final Map<dynamic, num> dataMap;

  AxisPainter(this.dataMap);

  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
