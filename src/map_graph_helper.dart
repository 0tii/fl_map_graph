import 'package:flutter/material.dart';
import 'dart:math';

class MapGraphHelper {
  static List<Offset> offsetsFromMap(Map<dynamic, num> data, Size size) {
    //list of offsets to return filled
    List<Offset> offsets = [];

    //get min and max values from list
    var yMax = data.values.toList().reduce(max);
    var yMin = data.values.toList().reduce(min);

    //get heigh per range point
    var heightFactor = size.height / (yMax - yMin);

    //point spacing interval on the x-axis, indexed at 0
    var intervalX = size.width / (data.length - 1);

    //for each data point add respective x and y offset
    for (var i = 0; i < data.values.length; i++) {
      offsets.add(
        Offset(i * intervalX,
            size.height - (data.values.elementAt(i) - yMin) * heightFactor),
      );
    }
    return offsets;
  }
}
