class StatisticsModel {
  final Map<String, Sensor> sensor1;
  final Map<String, Sensor> sensor2;

  StatisticsModel({
    required this.sensor1,
    required this.sensor2,
  });

  factory StatisticsModel.fromJson(Map<String, dynamic> json) =>
      StatisticsModel(
        sensor1: Map.from(json["sensor1"]).map((k, v) {
          final value = Map<String, dynamic>.from(v as Map);
          return MapEntry<String, Sensor>(k.toString(), Sensor.fromJson(value));
        }),
        sensor2: Map.from(json["sensor2"]).map((k, v) {
          final value = Map<String, dynamic>.from(v as Map);
          return MapEntry<String, Sensor>(k.toString(), Sensor.fromJson(value));
        }),
      );

  Map<String, dynamic> toJson() => {
        "sensor1": Map.from(sensor1)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "sensor2": Map.from(sensor2)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Sensor {
  final int temperature;
  final int soil;
  final int humidity;

  Sensor({
    required this.temperature,
    required this.soil,
    required this.humidity,
  });

  factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
        temperature: json["temperature"],
        soil: json["soil"],
        humidity: json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "soil": soil,
        "humidity": humidity,
      };
}
