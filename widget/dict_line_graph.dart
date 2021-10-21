import 'package:flutter/material.dart';
import 'package:flutter_line_graph/src/dict_graph_painter.dart';

class DictLineGraph extends StatelessWidget {
  final double width, height;

  const DictLineGraph({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DictGraphPainter(),
      size: Size(width, height),
    );
  }
}
