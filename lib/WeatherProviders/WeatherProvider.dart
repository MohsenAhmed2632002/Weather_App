import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/weatherModel.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }
      WeatherModel? get weatherData => _weatherData;

}
