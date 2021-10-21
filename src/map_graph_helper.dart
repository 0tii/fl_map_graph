import 'package:flutter/material.dart';
import 'dart:math';

class MapGraphHelper {
  static List<Offset> offsetsFromDict(Map<dynamic, num> data, Size size) {
    //the x axis data point interval - 0 indexed
    var intervalX = size.width / (data.length - 1);
    /*
    ? lowest value = size.height, highest value = 0
    ! -> 
    */
    var factorY = (size.height / data.values.toList().reduce(max));
    List<Offset> offsets = [];
    for (var i = 0; i < data.values.length; i++) {
      offsets.add(
        Offset(i * intervalX, data.values.elementAt(i) * factorY),
      );
    }
    return offsets;
  }
}
