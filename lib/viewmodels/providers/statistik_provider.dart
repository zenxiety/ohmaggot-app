import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maggood/models/historystats_model.dart';
import 'package:maggood/utils/appstate.dart';

class StatistikProvider with ChangeNotifier {
  HistoryStatsModel? historyStatsModel;

  AppState appState = AppState.initial;

  StatistikProvider() {
    getHistoryStats();
  }

  void getHistoryStats() async {
    appState = AppState.loading;
    notifyListeners();

    try {
      final doc = await FirebaseFirestore.instance
          .collection("statistics")
          .doc("0")
          .get();

      print("DOC ${doc.data()}");

      historyStatsModel = HistoryStatsModel.fromFirestore(doc.data() ?? {});
      notifyListeners();
    } catch (e) {
      print("ERROR $e");
      appState = AppState.error;
      notifyListeners();
    }
  }
}
