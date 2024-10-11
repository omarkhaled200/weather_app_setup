import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_setup/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
import 'package:weather_app_setup/cubits/get_current_weather_cubit/get_current_weather_state.dart';
import 'package:weather_app_setup/views/searching_screen.dart';
import 'package:weather_app_setup/widgets/noweatherbody.dart';
import 'package:weather_app_setup/widgets/weatherinfobody.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather App',
            style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchingScreen();
                  }));
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25,
                ))
          ],
        ),
        body: BlocBuilder<GetCurrentWeatherCubit, weatherstate>(
          builder: (context, state) {
            if (state is initialState) {
              return Noweatherbody();
            } else if (state is WeatherloadedstateP) {
              return Weatherinfobody(weather:state.weatherModels!,);
            } else {
              return Text('Oops there was an error');
            }
          },
        ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_app_setup/cubits/get_current_weather_cubit/get_current_weather_cubit.dart';
// import 'package:weather_app_setup/cubits/get_current_weather_cubit/get_current_weather_state.dart';
// import 'package:weather_app_setup/views/searching_screen.dart';
// import 'package:weather_app_setup/widgets/noweatherbody.dart';
// import 'package:weather_app_setup/widgets/weatherinfobody.dart';

// class Homeview extends StatefulWidget {
//   const Homeview({super.key});

//   @override
//   _HomeviewState createState() => _HomeviewState();
// }

// class _HomeviewState extends State<Homeview> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Weather',
//           style: TextStyle(
//               fontSize: 23, fontWeight: FontWeight.w500, color: Colors.white),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return SearchingScreen();
//                 }));
//               },
//               icon: Icon(
//                 Icons.search,
//                 color: Colors.white,
//                 size: 25,
//               ))
//         ],
//       ),
//       body: BlocBuilder<GetCurrentWeatherCubit, weatherstate>(
//         builder: (context, state) {
//           if (state is initialState) {
//             return Noweatherbody();
//           } else if (state is WeatherloadedstateP) {
//             return Weatherinfobody();
//           } else {
//             return Text('Oops there was an error');
//           }
//         },
//       ),
//       backgroundColor: getWeatherBackgroundColor(context),
//     );
//   }

//   Color getWeatherBackgroundColor(BuildContext context) {
//     final weatherCondition = BlocProvider.of<GetCurrentWeatherCubit>(context)
//         .weatherModel
//         ?.weathercondition;
//     switch (weatherCondition?.toLowerCase()) {
//       case "sunny":
//       case "clear":
//         return Colors.yellow.shade200;
//       case "partly cloudy":
//       case "blizzard":
//         return Colors.lightBlue.shade200;
//       case "cloudy":
//       case "overcast":
//         return Colors.grey.shade300;
//       case "mist":
//       case "fog":
//       case "freezing fog":
//         return Colors.blueGrey.shade200;
//       case "patchy rain possible":
//       case "light drizzle":
//       case "patchy light rain":
//       case "light rain":
//       case "moderate rain":
//       case "heavy rain":
//         return Colors.blue.shade200;
//       case "patchy snow possible":
//       case "light snow":
//       case "moderate snow":
//       case "heavy snow":
//         return Colors.lightBlue.shade200;
//       case "patchy sleet possible":
//       case "light sleet":
//       case "moderate or heavy sleet":
//         return Colors.cyan.shade200;
//       case "thundery outbreaks possible":
//       case "patchy light rain with thunder":
//       case "moderate or heavy rain with thunder":
//         return Colors.deepPurple.shade200;
//       case "blowing snow":
//         return Colors.blueGrey.shade200;
//       case "ice pellets":
//         return Colors.teal.shade200;
//       default:
//         return Colors.blue.shade200;
//     }
//   }
// }
