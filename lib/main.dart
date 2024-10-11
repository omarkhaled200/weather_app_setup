import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_setup/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app_setup/cubits/get_current_weather_cubit/get_current_weather_state.dart';
import 'package:weather_app_setup/views/HomeView.dart';
import 'package:weather_app_setup/views/searching_screen.dart';

void main() {
  runApp(Weatherapp());
}

class Weatherapp extends StatelessWidget {
  const Weatherapp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCurrentWeatherCubit(),
      child: Builder(
          builder: (context) =>
              BlocBuilder<GetCurrentWeatherCubit, weatherstate>(
                builder: (context, state) {
                  return MaterialApp(
                    theme: ThemeData(
                      primarySwatch: getWeatherColorByCondition(
                        BlocProvider.of<GetCurrentWeatherCubit>(context)
                            .weatherModel
                            ?.weathercondition,
                      ),
                      // appBarTheme: AppBarTheme(
                      //   backgroundColor: getWeatherColorByCondition(
                      //     BlocProvider.of<GetCurrentWeatherCubit>(context).weatherModel?.weathercondition
                      //   )
                      // )
                      useMaterial3: false
                    ),
                    debugShowCheckedModeBanner: false,
                    home: const Homeview(),
                  );
                },
              )),
    );
  }
}

MaterialColor getWeatherColorByCondition(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case "sunny":
    case "clear":
      return Colors.yellow; // Bright, sunny yellow
    case "partly cloudy":
    case "blizzard":
      return Colors.lightBlue; // Light sky blue
    case "cloudy":
      return Colors.grey; // Cloudy grey
    case "overcast":
      return Colors.blueGrey; // Darker grey for overcast
    case "mist":
    case "fog":
    case "freezing fog":
      return Colors.blueGrey; // Foggy blue-grey
    case "patchy rain possible":
    case "light drizzle":
    case "patchy light rain":
    case "light rain":
    case "moderate rain":
    case "heavy rain":
      return Colors.blue; // Rainy blue
    case "patchy snow possible":
    case "light snow":
    case "moderate snow":
    case "heavy snow":
      return Colors.lightBlue; // Cold, snowy blue
    case "patchy sleet possible":
    case "light sleet":
    case "moderate or heavy sleet":
      return Colors.cyan; // Icy cyan
    case "thundery outbreaks possible":
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
      return Colors.deepPurple; // Thunderous purple
    case "blowing snow":
      return Colors.blueGrey; // Blowing, snowy white
    case "ice pellets":
      return Colors.teal; // Icy teal
    default:
      return Colors.blue; // Neutral color for other conditions
  }
}
