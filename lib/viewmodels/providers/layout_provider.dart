import 'package:flutter/material.dart';

class LayoutProvider with ChangeNotifier {
  int activeIdx = 1;

  void changeIdx(int value) {
    activeIdx = value;
    notifyListeners();
  }
}
