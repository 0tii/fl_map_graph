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

    //line paint
    final pathPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    //point paint
    final pointPaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    //draw path along offsets
    var path = Path();
    path.moveTo(points[0].dx, points[0].dy);
    for (var i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, pathPaint);

    //draw only points
    canvas.drawPoints(pointMode, points, pointPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    //todo check if data changed or display mode
    return false;
  }
}
