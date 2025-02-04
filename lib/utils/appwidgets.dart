import 'package:flutter/material.dart';

BoxShadow cardShadow() {
  return const BoxShadow(
    color: Color.fromRGBO(0, 0, 0, .25),
    blurRadius: 12,
    offset: Offset(0, 4),
  );
}
