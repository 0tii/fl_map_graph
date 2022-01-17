import 'package:flutter/material.dart';
import 'package:flutter_line_graph/src/axis_painter.dart';
import 'package:flutter_line_graph/src/map_graph_painter.dart';

class MapLineGraph extends StatelessWidget {
  ///Size
  final double width, height;

  ///Map of the graph data. X-Axis (key) type is **dynamic**. Y-Axis (value) has to be **num**.
  final Map<dynamic, num> dataMap;

  const MapLineGraph({
    Key? key,
    required this.width,
    required this.height,
    required this.dataMap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: MapGraphPainter(dataMap: dataMap),
      painter: AxisPainter(dataMap),
      size: Size(width, height),
    );
  }
}
