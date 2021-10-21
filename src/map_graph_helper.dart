import 'package:flutter/material.dart';
import 'dart:math';

class MapGraphHelper {
  static List<Offset> offsetsFromDict(Map<dynamic, num> data, Size size) {
    var intervalX = size.width / data.length; //the x axis data point interval
    var factorY =
        size.height / data.values.toList().reduce(max); //the y-axis factor
    List<Offset> offsets = [];
    int index = 0;

    for (var value in data.values) {
      offsets.add(Offset(index * intervalX, value * factorY));
      index++;
    }

    return offsets;
  }
}
