import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/weatherModel.dart';
import 'package:flutter_application_1/WeatherProviders/WeatherProvider.dart';
import 'package:flutter_application_1/services/Weather_Services.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class searchpage extends StatelessWidget {
  String? cityName;
  searchpage({
    this.upDateUi,
  });
  VoidCallback? upDateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Enter The City ",
            ),
            TextFormField(
              onFieldSubmitted: (data) async {
                String cityName = data;
                Weatherservices ser = Weatherservices();
                WeatherModel weather = await ser.getweather(cityName: cityName);
                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = weather;
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Enter City"),
                contentPadding: EdgeInsets.all(3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
