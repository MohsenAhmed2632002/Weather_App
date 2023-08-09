import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cubits/WeatherCubit/WeatherCubit.dart';
import 'package:flutter_application_1/pages/MainPage.dart';
import 'package:flutter_application_1/services/Weather_Services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => WeatherCubit(
        Weatherservices(),
      ),
      child: Weather(),
    ),
  );
}

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:
            BlocProvider.of<WeatherCubit>(context).weatherModel?.getColor(),
      ),
      home: Homepage(),
    );
  }
}
