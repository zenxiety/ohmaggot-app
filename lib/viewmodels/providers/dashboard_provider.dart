import 'package:flutter/material.dart';
import 'package:maggood/models/dashboard_model.dart';
import 'package:maggood/utils/appstate.dart';
import 'package:maggood/viewmodels/services/services.dart';

class DashboardProvider with ChangeNotifier {
  DashboardModel? dashboardModel;
  AppState appState = AppState.initial;
  late final DateTime dateTime;

  DashboardProvider() {
    listenDashboardData();
    dateTime = DateTime.now();
  }

  void listenDashboardData() {
    appState = AppState.loading;
    notifyListeners();

    try {
      Services.getDashboardData().listen((data) {
        dashboardModel = data;
        appState = AppState.success;
        notifyListeners();
      });
    } catch (_) {
      appState = AppState.error;
      notifyListeners();
    }
  }
}
