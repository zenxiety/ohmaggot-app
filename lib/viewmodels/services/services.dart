import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:maggood/models/dashboard_model.dart';
import 'package:maggood/models/historystats_model.dart';

class Services {
  static Stream<DashboardModel> getDashboardData() {
    try {
      DatabaseReference dbRef = FirebaseDatabase.instance.ref("");
      print("DBREF: $dbRef");

      return dbRef.onValue.map((event) {
        DataSnapshot snapshot = event.snapshot;
        print("Snapshot $snapshot");
        final values = Map<String, dynamic>.from(snapshot.value as Map);

        print("VAL $values");

        return DashboardModel.fromJson(values);
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Stream<List> getHistoryStats() {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      return firestore.collection("statistics").snapshots().map((snapshot) {
        print(snapshot.docs);
        return [];
        // return snapshot.docs.map((doc) {
        //   return HistoryStatsModel.fromJson(doc.data());
        // });
      });
    } catch (_) {
      rethrow;
    }
  }
}
