import 'package:weather_app_setup/models/weather_models.dart';

class weatherstate {}

class initialState extends weatherstate {}

class WeatherloadedstateP extends weatherstate {
  final WeatherModels ?weatherModels;

  WeatherloadedstateP(this.weatherModels);

}

class Weatherfailurestate extends weatherstate {}
