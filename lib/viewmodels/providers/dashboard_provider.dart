import 'package:flutter/material.dart';
import 'package:maggood/models/dashboard_model.dart';
import 'package:maggood/utils/appstate.dart';
import 'package:maggood/viewmodels/services/services.dart';

class DashboardProvider with ChangeNotifier {
  DashboardModel? dashboardModel;
  late final DateTime dateTime;

  AppState appState = AppState.initial;

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
        print("PROVIDER");
      });
    } catch (e) {
      print(e);
      appState = AppState.error;
      notifyListeners();
    }
  }
}
