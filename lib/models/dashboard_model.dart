class DashboardModel {
  final Sensor sensor1;
  final Sensor sensor2;

  DashboardModel({
    required this.sensor1,
    required this.sensor2,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    final sensor1Data = Map<String, dynamic>.from(json["DHT22"]);
    final sensor2Data = Map<String, dynamic>.from(json["DHT22_2"]);

    return DashboardModel(
      sensor1: Sensor.fromJson(sensor1Data),
      sensor2: Sensor.fromJson(sensor2Data),
    );
  }

  Map<String, dynamic> toJson() => {
        "sensor1": sensor1.toJson(),
        "sensor2": sensor2.toJson(),
      };
}

class Sensor {
  final double temperature;
  final double humidity;
  final double soil;

  Sensor({
    required this.temperature,
    required this.humidity,
    required this.soil,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
        temperature: json["temperature"]?.toDouble() ?? 0.0,
        humidity: json["humidity"]?.toDouble() ?? 0.0,
        soil: json["soil"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "humidity": humidity,
        "soil": soil,
      };
}
