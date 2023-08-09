import 'dart:convert';

import 'package:flutter_application_1/Model/weatherModel.dart';
import 'package:http/http.dart' as http;

class Weatherservices {
  Future<WeatherModel> getweather({required String cityName}) async {
    String apiKey = "f5e657f7a0484ab5b25173533231907";
    String baseUrl = "https://api.weatherapi.com/v1";
    Uri url = Uri.parse(
      // "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=no&alerts=no"
      "$baseUrl/current.json?key=$apiKey&q=$cityName",
    );
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel res = WeatherModel.fromjson(data);
    return res;
  }
}
