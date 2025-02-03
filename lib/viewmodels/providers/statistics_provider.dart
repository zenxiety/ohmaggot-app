import 'package:flutter/material.dart';
import 'package:maggood/models/statistics_model.dart';
import 'package:maggood/utils/appstate.dart';
import 'package:maggood/viewmodels/services/services.dart';

class StatisticsProvider with ChangeNotifier {
  StatisticsModel? statisticsModel;
  late final DateTime dateTime;

  AppState appState = AppState.initial;

  StatisticsProvider() {
    listenStatistikData();
    dateTime = DateTime.now();
  }

  void listenStatistikData() {
    appState = AppState.loading;
    notifyListeners();

    try {
      Services.getStatisticsData().listen((data) {
        statisticsModel = data;
        appState = AppState.success;
        notifyListeners();
      });
    } catch (_) {
      appState = AppState.error;
      notifyListeners();
    }
  }
}
