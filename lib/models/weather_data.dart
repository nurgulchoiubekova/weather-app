
class WeatherData {
  const WeatherData({
    required this.location,
    required this.current,
  });

  final Location location;
  final Current current;

  factory WeatherData.fromJson(Map<String, dynamic> map) {
    return WeatherData(
      location: Location.fromJson(map['location'] as Map<String, dynamic>),
      current: Current.fromJson(map['current'] as Map<String, dynamic>),
    );
  }
}

class Current {
  const Current({
    required this.tempC,
    required this.condition,
    required this.windKph,
    required this.precipMm,
    required this.humidity,
  });

  final double tempC;
  final Condition condition;
  final double windKph;
  final double precipMm;
  final int humidity;

  factory Current.fromJson(Map<String, dynamic> map) {
    return Current(
      tempC: map['temp_c'] as double,
      condition: Condition.fromJson(map['condition'] as Map<String, dynamic>),
      windKph: map['wind_kph'] as double,
      precipMm: map['precip_mm'] as double,
      humidity: map['humidity'] as int,
    );
  }
}

class Condition {
  const Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  final String text;
  final String icon;
  final int code;

  factory Condition.fromJson(Map<String, dynamic> map) {
    return Condition(
      text: map['text'] as String,
      icon: map['icon'] as String,
      code: map['code'] as int,
    );
  }
}

class Location {
  const Location({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });

  final String name;
  final String region;
  final String country;
  final String localtime;

  factory Location.fromJson(Map<String, dynamic> map) {
    return Location(
      name: map['name'] as String,
      region: map['region'] as String,
      country: map['country'] as String,
      localtime: map['localtime'] as String,
    );
  }
}
