import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:maggood/utils/appcolor.dart';
import 'package:maggood/utils/apptime.dart';
import 'package:maggood/utils/appwidgets.dart';
import 'package:maggood/viewmodels/providers/statistics_provider.dart';
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
                  ...buildGraphCards(1, context),
                  const SizedBox(height: 20),
                  ...buildGraphCards(2, context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildGraphCards(int idx, BuildContext context) {
    return [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9999),
          color: mainRed,
        ),
        child: Text(
          "Tray $idx",
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            color: mainWhite,
          ),
        ),
      ),
      const SizedBox(height: 20),
      SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: mainWhite,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [cardShadow()],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Suhu/Temperatur",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 360,
                      height: 360,
                      child: Consumer<StatisticsProvider>(
                          builder: (context, state, _) {
                        return LineChart(
                          LineChartData(
                            titlesData: FlTitlesData(
                              topTitles: const AxisTitles(
                                axisNameSize: 0,
                              ),
                              rightTitles: const AxisTitles(
                                axisNameSize: 0,
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    return getGraphTimeLabel(value);
                                  },
                                  interval: 5,
                                ),
                                axisNameWidget: const Text("Pukul"),
                              ),
                              leftTitles: const AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: 1,
                                ),
                                axisNameWidget: Text("° celcius"),
                              ),
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                color: mainGreen,
                                spots: [
                                  for (var i = 1; i <= 20; i++)
                                    FlSpot(
                                        i.toDouble(),
                                        idx == 1
                                            ? state
                                                    .statisticsModel
                                                    ?.sensor1[i
                                                        .toString()
                                                        .padLeft(2, '0')]
                                                    ?.temperature
                                                    .toDouble() ??
                                                0
                                            : state
                                                    .statisticsModel
                                                    ?.sensor2[i
                                                        .toString()
                                                        .padLeft(2, '0')]
                                                    ?.temperature
                                                    .toDouble() ??
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
            const SizedBox(width: 40),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: mainWhite,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [cardShadow()],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Kelembapan Udara",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 360,
                      height: 360,
                      child: Consumer<StatisticsProvider>(
                          builder: (context, state, _) {
                        return LineChart(
                          LineChartData(
                            titlesData: FlTitlesData(
                              topTitles: const AxisTitles(
                                axisNameSize: 0,
                              ),
                              rightTitles: const AxisTitles(
                                axisNameSize: 0,
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    return getGraphTimeLabel(value);
                                  },
                                  interval: 5,
                                ),
                                axisNameWidget: const Text("Pukul"),
                              ),
                              leftTitles: const AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: 1,
                                  reservedSize: 24,
                                ),
                                axisNameWidget: Text("% (persen)"),
                              ),
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                color: mainGreen,
                                spots: [
                                  for (var i = 1; i <= 20; i++)
                                    FlSpot(
                                        i.toDouble(),
                                        idx == 1
                                            ? state
                                                    .statisticsModel
                                                    ?.sensor1[i
                                                        .toString()
                                                        .padLeft(2, '0')]
                                                    ?.humidity
                                                    .toDouble() ??
                                                0
                                            : state
                                                    .statisticsModel
                                                    ?.sensor2[i
                                                        .toString()
                                                        .padLeft(2, '0')]
                                                    ?.humidity
                                                    .toDouble() ??
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
            const SizedBox(width: 40),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: mainWhite,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [cardShadow()],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Kelembapan Substrat",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 360,
                      height: 360,
                      child: Consumer<StatisticsProvider>(
                          builder: (context, state, _) {
                        return LineChart(
                          LineChartData(
                            titlesData: FlTitlesData(
                              topTitles: const AxisTitles(
                                axisNameSize: 0,
                              ),
                              rightTitles: const AxisTitles(
                                axisNameSize: 0,
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) {
                                    return getGraphTimeLabel(value);
                                  },
                                  interval: 5,
                                ),
                                axisNameWidget: const Text("Pukul"),
                              ),
                              leftTitles: const AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 24,
                                  interval: 1,
                                ),
                                axisNameWidget: Text("% (persen)"),
                              ),
                            ),
                            lineBarsData: [
                              LineChartBarData(
                                color: mainGreen,
                                spots: [
                                  for (var i = 1; i <= 20; i++)
                                    FlSpot(
                                        i.toDouble(),
                                        idx == 1
                                            ? state
                                                    .statisticsModel
                                                    ?.sensor1[i
                                                        .toString()
                                                        .padLeft(2, '0')]
                                                    ?.soil
                                                    .toDouble() ??
                                                0
                                            : state
                                                    .statisticsModel
                                                    ?.sensor2[i
                                                        .toString()
                                                        .padLeft(2, '0')]
                                                    ?.soil
                                                    .toDouble() ??
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
    ];
  }
}
