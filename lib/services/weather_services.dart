// Import necessary standard libraries only
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app_setup/models/weather_models.dart';
//https://api.weatherapi.com/v1/forecast.json?key=4326dd0f91704eea981175128242808&q=cairo
class weatherServices {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apikey = '4326dd0f91704eea981175128242808';
  weatherServices();

  Future<WeatherModels> getcurrentweather({required String cityname}) async {
    try {
      final Response response = await dio
          .get('$baseUrl/forecast.json?key=$apikey&q=$cityname&days=1');
      WeatherModels weatherModel = WeatherModels.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errormessage = e.response?.data['error']['message'] ??
          'oops there was an error,try later';
      throw Exception(errormessage);
    } catch (e) {
      log('Exception: ${e.toString()}');
      throw Exception('oops there was and error,try later');
    }
  }
}
