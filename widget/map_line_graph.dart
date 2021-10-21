import 'package:flutter/material.dart';
import 'package:flutter_line_graph/src/map_graph_painter.dart';

class MapLineGraph extends StatelessWidget {
  final double width, height;

  const MapLineGraph({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MapGraphPainter(),
      size: Size(width, height),
    );
  }
}
