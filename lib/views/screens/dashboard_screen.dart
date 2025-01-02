import 'package:flutter/material.dart';
import 'package:maggood/utils/appstate.dart';
import 'package:maggood/viewmodels/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("DASHBOARD"),
          Consumer<DashboardProvider>(
            builder: (context, state, _) {
              final greeting = state.dateTime.hour >= 0 &&
                      state.dateTime.hour < 10
                  ? "Pagi"
                  : state.dateTime.hour >= 10 && state.dateTime.hour < 15
                      ? "Siang"
                      : state.dateTime.hour >= 15 && state.dateTime.hour < 18
                          ? "Sore"
                          : "Malam";

              return Text("Selamat $greeting!");
            },
          ),
          Center(
            child: Table(
              border: TableBorder.all(color: Colors.white),
              children: [
                TableRow(
                  children: [
                    const Text("Suhu Udara"),
                    Consumer<DashboardProvider>(
                      builder: (context, value, _) {
                        if (value.appState == AppState.loading) {
                          return const Text("LOADING");
                        }

                        if (value.dashboardModel == null) {
                          return const Text("EMPTY");
                        }

                        return Text(
                          value.dashboardModel!.temperature.toString(),
                        );
                      },
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Text("Kelembapan Udara"),
                    Consumer<DashboardProvider>(
                      builder: (context, state, _) {
                        if (state.appState == AppState.loading) {
                          return const Text("LOADING");
                        }

                        if (state.dashboardModel == null) {
                          return const Text("EMPTY");
                        }

                        return Text(
                          state.dashboardModel!.humidity.toString(),
                        );
                      },
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Text("Kelembapan Tanah"),
                    Consumer<DashboardProvider>(
                      builder: (context, state, _) {
                        if (state.appState == AppState.loading) {
                          return const Text("LOADING");
                        }

                        if (state.dashboardModel == null) {
                          return const Text("EMPTY");
                        }

                        return Text(
                          state.dashboardModel!.soil.toString(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
