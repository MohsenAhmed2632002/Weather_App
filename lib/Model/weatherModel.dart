import 'package:flutter/material.dart';

class WeatherModel {
  String? name;
  String? country;
  String? tz_id;
  double? temp_f;
  double? temp_c;
  String? localtime;
  String? state;
  String? icon;
  WeatherModel({
    required this.name,
    required this.country,
    required this.tz_id,
    required this.temp_c,
    required this.temp_f,
    required this.localtime,
    required this.state,
    required this.icon,
  });
  factory WeatherModel.fromjson(dynamic data) {
    var jsondata = data["location"];

    return WeatherModel(
      name: jsondata["name"],
      state: data["current"]["condition"]["text"],
      icon: data["current"]["condition"]["icon"],
      country: jsondata["country"],
      tz_id: jsondata["tz_id"],
      temp_c: data["current"]["temp_c"],
      temp_f: data["current"]["temp_f"],
      localtime: jsondata["localtime"],
    );
  }
  MaterialColor getColor() {
    switch (state) {
      case "Clear":
        return Colors.blueGrey;

      case "Partly cloudy":
        return Colors.cyan;

      case "Light rain":
        return Colors.blueGrey;

      default:
        return Colors.blue;
    }
  }
}
