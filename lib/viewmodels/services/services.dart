import 'package:firebase_database/firebase_database.dart';
import 'package:maggood/models/dashboard_model.dart';
import 'package:maggood/models/statistics_model.dart';

class Services {
  static Stream<DashboardModel> getDashboardData() {
    try {
      DatabaseReference dbRef = FirebaseDatabase.instance.ref("");
      return dbRef.onValue.map((event) {
        DataSnapshot snapshot = event.snapshot;
        final values = Map<String, dynamic>.from(snapshot.value as Map);

        return DashboardModel.fromJson(values);
      });
    } catch (_) {
      rethrow;
    }
  }

  static Stream<StatisticsModel> getStatisticsData() {
    try {
      DatabaseReference dbRef = FirebaseDatabase.instance.ref("statistics");
      return dbRef.onValue.map((event) {
        DataSnapshot snapshot = event.snapshot;

        final values = Map<String, dynamic>.from(snapshot.value as Map);

        return StatisticsModel.fromJson(values);
      });
    } catch (_) {
      rethrow;
    }
  }
}
