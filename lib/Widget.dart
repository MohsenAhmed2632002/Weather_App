
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cubits/WeatherCubit/WeatherCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Model/weatherModel.dart';

class HasData extends StatelessWidget {
  const HasData({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
        color:
            BlocProvider.of<WeatherCubit>(context).weatherModel?.getColor(),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Name Of City: ${weatherData!.name}",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            Text(
              "Name Of Country: ${weatherData!.country}",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "state: ${weatherData!.state}",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "temp_f: ${weatherData!.temp_f}",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "temp_c: ${weatherData!.temp_c}",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Text(
              "id:${weatherData!.tz_id}",
              style: TextStyle(
                fontSize: 35,
              ),
            ),
          ],
        ),
      );
  }
}

class EmptyData extends StatelessWidget {
  const EmptyData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Empty.",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ],
        ),
      );
  }
}