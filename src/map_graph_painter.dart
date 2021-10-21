import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_line_graph/src/map_graph_helper.dart';

class MapGraphPainter extends CustomPainter {
  final Map<dynamic, num> dataMap;

  MapGraphPainter(this.dataMap);

  @override
  void paint(Canvas canvas, Size size) {
    const pointMode = ui.PointMode.points;
    var points = MapGraphHelper.offsetsFromDict(dataMap, size);
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3;
    for (var i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
    final paint2 = Paint()
      ..color = Colors.lime
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    for (var i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
    canvas.drawPoints(pointMode, points, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    //todo check if data changed or display mode
    return false;
  }
}
