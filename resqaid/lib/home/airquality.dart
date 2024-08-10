import 'dart:convert';
import 'package:http/http.dart' as http;

class AirQuality {
  final int aqi;
  final double lat;
  final double lon;
  final List<Forecast> forecast;

  AirQuality({
    required this.aqi,
    required this.lat,
    required this.lon,
    required this.forecast,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json) {
    return AirQuality(
      aqi: json['data']['aqi'],
      lat: json['data']['city']['geo'][0],
      lon: json['data']['city']['geo'][1],
      forecast: (json['data']['forecast']['daily']['pm25'] as List)
          .map((data) => Forecast.fromJson(data))
          .toList(),
    );
  }
}

class Forecast {
  final String day;
  final int avg;
  final int min;
  final int max;

  Forecast({
    required this.day,
    required this.avg,
    required this.min,
    required this.max,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      day: json['day'],
      avg: json['avg'],
      min: json['min'],
      max: json['max'],
    );
  }
}

Future<AirQuality> fetchAirQuality() async {
  const String apiUrl =
      'https://api.waqi.info/feed/here/?token=6b96a07ff45c1dcc3931d81e109506673c44e728'; // API URL

  final response = await http.get(Uri.parse(apiUrl));
  // log(response.body);
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return AirQuality.fromJson(jsonData);
  } else {
    throw Exception('Failed to load air quality data');
  }
}

Future<dynamic> fetchAirQuality2() async {
  const String apiUrl =
      'https://api.waqi.info/feed/here/?token=6b96a07ff45c1dcc3931d81e109506673c44e728'; // API URL

  final response = await http.get(Uri.parse(apiUrl));
  // log(response.body);
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return jsonData;
  } else {
    throw Exception('Failed to load air quality data');
  }
}
