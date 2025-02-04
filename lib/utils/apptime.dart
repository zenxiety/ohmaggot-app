import 'package:flutter/material.dart';

Widget getGraphTimeLabel(double value) {
  final hour = DateTime.now().hour;
  final min = DateTime.now().minute - (21 - value.toInt());

  final formattedHour = min < 0 ? hour - 1 : hour;
  final formattedMin = (min < 0 ? 59 : min);

  final paddedHour = "$formattedHour".padLeft(2, "0");
  final paddedMin = "$formattedMin".padLeft(2, "0");

  return Text(
    "$paddedHour:$paddedMin",
  );
}
