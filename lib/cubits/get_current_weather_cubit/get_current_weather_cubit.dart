import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_setup/cubits/get_current_weather_cubit/get_current_weather_state.dart';
import 'package:weather_app_setup/models/weather_models.dart';
import 'package:weather_app_setup/services/weather_services.dart';
import 'package:weather_app_setup/views/searching_screen.dart';

class GetCurrentWeatherCubit extends Cubit<weatherstate> {
  GetCurrentWeatherCubit() : super(initialState());
  WeatherModels? weatherModel;
  getweather({required String cityName}) async {
    try {
      weatherModel =
          await weatherServices().getcurrentweather(cityname: cityName);
      emit(WeatherloadedstateP(weatherModel!));
    } catch (e) {
      emit(Weatherfailurestate());
    }
  }
}
