import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cubits/WeatherCubit/WeatherCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class searchpage extends StatelessWidget {
  String? cityName;
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
              
// London
// Cairo
// Makassar
// Dubai
              onFieldSubmitted: (data) async {
                String cityName = data;
                BlocProvider.of<WeatherCubit>(context)
                    .getWeather(cityName: cityName);
                BlocProvider.of<WeatherCubit>(context).cityName = cityName;
               
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
