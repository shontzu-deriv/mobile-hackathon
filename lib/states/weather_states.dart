import 'package:flutter_weather_app/models/weather_model.dart';

abstract class WeatherStates{}

// class WeatherInitial extends WeatherState{}

class WeatherLoading extends WeatherStates{}

class WeatherLoaded extends WeatherStates{
  final WeatherModel weatherModel;

  WeatherLoaded({required this.weatherModel});
}

class WeatherError extends WeatherStates{
  final String errorMessage;
  WeatherError({required this.errorMessage});
}