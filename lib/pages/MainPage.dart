import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cubits/WeatherCubit/WeatherCubit.dart';
import 'package:flutter_application_1/Model/weatherModel.dart';
import 'package:flutter_application_1/Widget.dart';
import 'package:flutter_application_1/pages/search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubits/WeatherCubit/WeatherState.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: .7,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return searchpage();
                }));
              },
              icon: Icon(Icons.search_rounded),
            ),
          ],
        ),
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherWeatingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is WeatherSuccessState) {

              return HasData(weatherData: state.weatherModel );
            } else if (state is WeatherFailerState) {
              return Container(
                child: Text("there was an E"),
              );
            } else {
              return EmptyData();
            }
          },
        ));
  }
}
