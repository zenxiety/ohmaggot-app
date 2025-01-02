class DashboardModel {
  final double temperature;
  final double humidity;
  final double soil;

  DashboardModel({
    required this.temperature,
    required this.humidity,
    required this.soil,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        temperature: json["temperature"]?.toDouble(),
        humidity: json["humidity"]?.toDouble(),
        soil: json["soil"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "humidity": humidity,
        "soil": soil,
      };
}
