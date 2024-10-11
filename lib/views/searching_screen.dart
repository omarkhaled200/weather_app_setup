import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_setup/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app_setup/models/weather_models.dart';
import 'package:weather_app_setup/services/weather_services.dart';

class SearchingScreen extends StatelessWidget {
  const SearchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 243, 161, 55),
          title: Text(
            'Search a City',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        body: Center(
          child: SizedBox(
            width: 500,
            child: TextField(
              onSubmitted: (value) async {
                var getweathercubit =
                    BlocProvider.of<GetCurrentWeatherCubit>(context);
                getweathercubit.getweather(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 243, 161, 55)),
                  ),
                  border: OutlineInputBorder(),
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  hintText: 'Enter City Name',
                  labelText: 'Search'),
            ),
          ),
        ));
  }
}
