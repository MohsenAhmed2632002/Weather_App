import 'package:flutter/material.dart';
import 'package:flutter_application_1/WeatherProviders/WeatherProvider.dart';
import 'package:flutter_application_1/pages/MainPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
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
            Provider.of<WeatherProvider>(context).weatherData?.getColor(),
      ),
      home: Homepage(),
    );
  }
}
