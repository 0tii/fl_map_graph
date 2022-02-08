import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_line_graph/src/map_graph_helper.dart';

class MapGraphPainter extends CustomPainter {
  final Map<dynamic, num> dataMap;
  final Color color;
  final List<Color> gradientColors;
  final Offset from, to;
  final bool useGradient;
  final double lineWidth;

  final List<double> _colorStops = [];
  Map<dynamic, num>? oldData;

  ///[dataMap] must be a `Map<dynamic, num>` where the key index represents the x value and the value represents the y value of the dataset.
  ///By nature the data source must have constantly spaced key values in order to display its data accurately.
  ///
  ///[from] and [to] represent the gradient direction as normalized Vectors, where `Offset(0,0)` is top left and `Offset(1,1)` is bottom right, as per standard `rect` definition.
  ///Right is denoted by `Offset(1,0)` whereas left is represented by `Offset(0,0)`. Only need to be specified if [useGradient] is `true`, default is left to right.
  MapGraphPainter({
    required this.dataMap,
    this.color = const Color(0xFF4ACC60),
    this.gradientColors = const [
      Color(0xFF5EFF49),
      Color(0xFF0EAD00),
    ],
    this.from = const Offset(0, 0),
    this.to = const Offset(1, 0),
    this.useGradient = true,
    this.lineWidth = 3,
  }) {
    //prepare multi-color gradient computation
    if (gradientColors.length < 2) {
      _colorStops.add(0);
      return;
    }
    for (var i = 0; i < gradientColors.length; i++) {
      _colorStops.add(i * (1 / (gradientColors.length - 1)));
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    var points = MapGraphHelper.offsetsFromMap(dataMap, size);

    //graph line paint
    final pathPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;

    if (useGradient) {
      pathPaint.shader = ui.Gradient.linear(
          Offset(size.width * from.dx, size.height * from.dy),
          Offset(size.width * to.dx, size.height * to.dy),
          gradientColors,
          _colorStops);
    }
    //draw path along offsets
    var path = Path();
    path.moveTo(points[0].dx, points[0].dy);
    for (var i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, pathPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    //todo check if data changed or display mode
    if (dataMap == oldData) return false;
    oldData = dataMap;
    return true;
  }
}
