class HistoryStatsModel {
  final List<double> humidity;
  final List<double> soil;
  final List<double> temperature;

  HistoryStatsModel({
    required this.humidity,
    required this.soil,
    required this.temperature,
  });

  factory HistoryStatsModel.fromFirestore(Map<String, dynamic> json) =>
      HistoryStatsModel(
        humidity: List<double>.from(
            json["humidity"].map((x) => x?.toDouble() ?? 0.0)),
        soil: List<double>.from(json["soil"].map((x) => x?.toDouble() ?? 0.0)),
        temperature: List<double>.from(
            json["temperature"].map((x) => x?.toDouble() ?? 0.0)),
      );

  Map<String, dynamic> toJson() => {
        "humidity": List<dynamic>.from(humidity.map((x) => x)),
        "soil": List<dynamic>.from(soil.map((x) => x)),
        "temperature": List<dynamic>.from(temperature.map((x) => x)),
      };
}
