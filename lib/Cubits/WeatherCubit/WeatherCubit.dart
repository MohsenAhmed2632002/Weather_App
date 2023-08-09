import 'package:flutter_application_1/Cubits/WeatherCubit/WeatherState.dart';
import 'package:flutter_application_1/Model/weatherModel.dart';
import 'package:flutter_application_1/services/Weather_Services.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherservices) : super(WeatherIniState());
  Weatherservices weatherservices = Weatherservices();
  WeatherModel? weatherModel;
  String? cityName;
  getWeather({required String cityName}) async {
    emit(WeatherWeatingState());
    try {
      weatherModel = await weatherservices.getweather(cityName: cityName);
      emit(WeatherSuccessState(weatherModel: weatherModel!));
    } on Exception catch (e) {
      print(e);
      emit(WeatherFailerState());
    }
  }
}
