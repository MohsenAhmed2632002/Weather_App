import 'package:flutter_application_1/Model/weatherModel.dart';

abstract class WeatherState {}

class WeatherIniState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  WeatherModel? weatherModel;
  WeatherSuccessState({required this.weatherModel});
}

class WeatherFailerState extends WeatherState {}

class WeatherWeatingState extends WeatherState {}
