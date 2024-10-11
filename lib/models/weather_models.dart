import 'package:flutter/material.dart';

class WeatherModels {
  final String Cityname;
  final DateTime timeupdate;
  final String? image;
  final double avgtemp;
  final double maxtemp;
  final double mintemp;
  final String weathercondition;

  const WeatherModels({
    required this.Cityname,
    required this.timeupdate,
    this.image,
    required this.avgtemp,
    required this.maxtemp,
    required this.mintemp,
    required this.weathercondition,
  });

  factory WeatherModels.fromJson(json) {
    return WeatherModels(
        Cityname: json['location']['name'],
        timeupdate: DateTime.parse(json["current"]['last_updated']),
        image: json["forecast"]['forecastday'][0]['day']['condition']['icon'],
        avgtemp: json["forecast"]['forecastday'][0]['day']['avgtemp_c'],
        maxtemp: json["forecast"]['forecastday'][0]['day']['maxtemp_c'],
        mintemp: json["forecast"]['forecastday'][0]['day']['mintemp_c'],
        weathercondition: json["forecast"]['forecastday'][0]['day']['condition']['text']
        );
  }
}
