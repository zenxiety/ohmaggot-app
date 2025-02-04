import 'package:flutter/material.dart';
import 'package:maggood/utils/appcolor.dart';
import 'package:maggood/utils/appwidgets.dart';
import 'package:maggood/viewmodels/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 60),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1 / 2,
          decoration: const BoxDecoration(
            color: mainGreen,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SCREEN TITLE
                  const Text(
                    "Dashboard",
                    style: TextStyle(
                      color: mainWhite,
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                    ),
                  ),

                  // SCREEN SUBTITLE
                  Consumer<DashboardProvider>(builder: (context, state, _) {
                    final greeting = state.dateTime.hour >= 0 &&
                            state.dateTime.hour < 10
                        ? "Pagi"
                        : state.dateTime.hour >= 10 && state.dateTime.hour < 15
                            ? "Siang"
                            : state.dateTime.hour >= 15 &&
                                    state.dateTime.hour < 18
                                ? "Sore"
                                : "Malam";

                    return Text(
                      "Selamat $greeting!",
                      style: const TextStyle(
                        color: mainWhite,
                      ),
                    );
                  }),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainRed,
                      foregroundColor: mainWhite,
                    ),
                    onPressed: () {
                      launchUrl(Uri.parse("http://192.168.4.1:81/stream"));
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Pantau CCTV",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.broadcast_on_home),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // LIVE MONITORING
                  buildLiveMonitoring(0),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildLiveMonitoring(int i) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        color: mainWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [cardShadow()],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LIVE MONITORING TITLE
          const Text(
            "Pemantauan Langsung",
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),

          // LIVE MONITORING SUBTITLE
          const Text(
            "Pastikan kondisi media berada pada keadaan optimal.",
            style: TextStyle(
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 20),

          ...buildParameters(1),

          const SizedBox(height: 40),

          ...buildParameters(2),
        ],
      ),
    );
  }

  List<Widget> buildParameters(int i) {
    return [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9999),
          color: mainGreen,
        ),
        child: Text(
          "Tray $i",
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            color: mainWhite,
          ),
        ),
      ),

      const SizedBox(height: 10),

      // TEMPERATURE BAR
      Container(
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: secondaryGreen,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Consumer<DashboardProvider>(builder: (context, state, _) {
              final barValue = (MediaQuery.of(context).size.width - 80) *
                  (((((i == 1
                                  ? state.dashboardModel?.sensor1.temperature
                                  : state
                                      .dashboardModel?.sensor2.temperature) ??
                              25) -
                          25) /
                      4));

              return Container(
                width: barValue >= 0 ? barValue : 0,
                height: 110,
                color: mainGreen,
              );
            }),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Suhu/Temperatur",
                        style: TextStyle(
                          color: mainBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Ideal: 26-30°C",
                        style: TextStyle(
                          color: mainBlack,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Consumer<DashboardProvider>(builder: (context, state, _) {
                    return Text(
                      "${(i == 1 ? state.dashboardModel?.sensor1.temperature : state.dashboardModel?.sensor2.temperature) ?? "-"}°C"
                          .toString(),
                      style: const TextStyle(
                        color: mainBlack,
                        fontWeight: FontWeight.w800,
                        fontSize: 48,
                        letterSpacing: -2,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),

      const SizedBox(height: 20),

      // HUMIDITY
      Container(
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: secondaryRed,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Consumer<DashboardProvider>(builder: (context, state, _) {
              final barValue = (MediaQuery.of(context).size.width - 80) *
                  (((((i == 1
                                  ? state.dashboardModel?.sensor1.humidity
                                  : state.dashboardModel?.sensor2.humidity) ??
                              59) -
                          59) /
                      12));

              return Container(
                width: barValue >= 0 ? barValue : 0,
                height: 110,
                color: mainRed,
              );
            }),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kelembapan Udara",
                        style: TextStyle(
                          color: mainBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Ideal: 60-70%",
                        style: TextStyle(
                          color: mainBlack,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Consumer<DashboardProvider>(builder: (context, state, _) {
                    return Text(
                      "${(i == 1 ? state.dashboardModel?.sensor1.humidity : state.dashboardModel?.sensor2.humidity) ?? "-"}%"
                          .toString(),
                      style: const TextStyle(
                        color: mainBlack,
                        fontWeight: FontWeight.w900,
                        fontSize: 48,
                        letterSpacing: -2,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),

      const SizedBox(height: 20),

      // SOIL
      Container(
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: secondaryYellow,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Consumer<DashboardProvider>(builder: (context, state, _) {
              final barValue = (MediaQuery.of(context).size.width - 80) *
                  (((((i == 1
                                  ? state.dashboardModel?.sensor1.soil
                                  : state.dashboardModel?.sensor2.soil) ??
                              39) -
                          39) /
                      47));

              return Container(
                width: barValue >= 0 ? barValue : 0,
                height: 110,
                color: mainYellow,
              );
            }),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kelembapan Substrat",
                        style: TextStyle(
                          color: mainBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Ideal: 40-85%",
                        style: TextStyle(
                          color: mainBlack,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Consumer<DashboardProvider>(builder: (context, state, _) {
                    return Text(
                      "${(i == 1 ? state.dashboardModel?.sensor1.soil : state.dashboardModel?.sensor2.soil) ?? "-"}%"
                          .toString(),
                      style: const TextStyle(
                        color: mainBlack,
                        fontWeight: FontWeight.w900,
                        fontSize: 48,
                        letterSpacing: -2,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
