import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_setup/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app_setup/main.dart';
import 'package:weather_app_setup/models/weather_models.dart';

class Weatherinfobody extends StatelessWidget {
  const Weatherinfobody({super.key, required this.weather});
  final WeatherModels weather;
  @override
  Widget build(BuildContext context) {
    WeatherModels weatherModels =
        BlocProvider.of<GetCurrentWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:[
          getWeatherColorByCondition(weatherModels.weathercondition),
          getWeatherColorByCondition(weatherModels.weathercondition)[300]!,
          getWeatherColorByCondition(weatherModels.weathercondition)[50]!,
        ] ,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        )
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModels.Cityname,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            Text(
              'updated at : ${weatherModels.timeupdate.hour}:${weatherModels.timeupdate.minute}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Image.network('https:${weatherModels.image}'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Text(
                    '${weatherModels.avgtemp.round()}',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Column(
                    children: [
                      Text(
                        'maxTemp : ${weatherModels.maxtemp.round()}',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'minTemp : ${weatherModels.mintemp.round()}',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              '${weatherModels.weathercondition}',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
