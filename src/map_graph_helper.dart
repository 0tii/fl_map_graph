import 'package:flutter/material.dart';
import 'dart:math';

class MapGraphHelper {
  static List<Offset> offsetsFromDict(Map<dynamic, num> data, Size size) {
    //list of offsets to return filled
    List<Offset> offsets = [];

    //point spacing interval on the x-axis, indexed at 0
    var intervalX = size.width / (data.length - 1);

    /*
    todo IMPLEMENT CORRECT Y COORDINATES!
    */
    var factorY = (size.height / data.values.toList().reduce(max));

    //for each data point add respective x and y offset
    for (var i = 0; i < data.values.length; i++) {
      offsets.add(
        Offset(i * intervalX, data.values.elementAt(i) * factorY),
      );
    }
    return offsets;
  }
}
