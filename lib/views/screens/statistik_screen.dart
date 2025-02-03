import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:maggood/utils/appcolor.dart';
import 'package:maggood/viewmodels/providers/statistik_provider.dart';
import 'package:provider/provider.dart';

class StatistikScreen extends StatelessWidget {
  const StatistikScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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
              child: Column(
                children: [
                  const Text(
                    "Statistik Riwayat",
                    style: TextStyle(
                      color: mainWhite,
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                    ),
                  ),

                  const Text(
                    "Data riwayat untuk analisis dan pengambilan keputusan.",
                    style: TextStyle(
                      color: mainWhite,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // TEMPERATURE GRAPH CARD
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: mainWhite,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, .25),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // TEMPERATURE HISTORY
                          const Text(
                            "Suhu/Temperatur",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // TEMPERATURE GRAPH
                          SizedBox(
                            width: 360,
                            height: 360,
                            child: Consumer<StatistikProvider>(
                                builder: (context, state, _) {
                              return LineChart(
                                LineChartData(
                                  titlesData: const FlTitlesData(
                                    topTitles: AxisTitles(
                                      axisNameSize: 0,
                                    ),
                                    rightTitles: AxisTitles(
                                      axisNameSize: 0,
                                    ),
                                  ),
                                  lineBarsData: [
                                    LineChartBarData(
                                      color: mainGreen,
                                      spots: [
                                        for (var i = 0; i < 4; i++)
                                          FlSpot(
                                              i.toDouble(),
                                              state.historyStatsModel
                                                      ?.temperature[i] ??
                                                  0),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // HUMIDITY GRAPH CARD
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: mainWhite,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, .25),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // TEMPERATURE HISTORY
                          const Text(
                            "Kelembapan Udara",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // TEMPERATURE GRAPH
                          SizedBox(
                            width: 360,
                            height: 360,
                            child: Consumer<StatistikProvider>(
                                builder: (context, state, _) {
                              return LineChart(
                                LineChartData(
                                  titlesData: const FlTitlesData(
                                    topTitles: AxisTitles(
                                      axisNameSize: 0,
                                    ),
                                    rightTitles: AxisTitles(
                                      axisNameSize: 0,
                                    ),
                                  ),
                                  lineBarsData: [
                                    LineChartBarData(
                                      color: mainGreen,
                                      spots: [
                                        for (var i = 0; i < 4; i++)
                                          FlSpot(
                                              i.toDouble(),
                                              state.historyStatsModel
                                                      ?.humidity[i] ??
                                                  0),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // SOIL GRAPH CARD
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: mainWhite,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, .25),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // TEMPERATURE HISTORY
                          const Text(
                            "Kelembapan Substrat",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // TEMPERATURE GRAPH
                          SizedBox(
                            width: 360,
                            height: 360,
                            child: Consumer<StatistikProvider>(
                                builder: (context, state, _) {
                              return LineChart(
                                LineChartData(
                                  titlesData: const FlTitlesData(
                                    topTitles: AxisTitles(
                                      axisNameSize: 0,
                                    ),
                                    rightTitles: AxisTitles(
                                      axisNameSize: 0,
                                    ),
                                  ),
                                  lineBarsData: [
                                    LineChartBarData(
                                      color: mainGreen,
                                      spots: [
                                        for (var i = 0; i < 4; i++)
                                          FlSpot(
                                              i.toDouble(),
                                              state.historyStatsModel
                                                      ?.soil[i] ??
                                                  0),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
