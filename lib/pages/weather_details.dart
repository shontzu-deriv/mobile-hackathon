import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/states/weather_cubit.dart';
import 'package:flutter_weather_app/states/weather_states.dart';
import 'package:flutter_weather_app/widgets/weather_information.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({Key? key, required this.cityName}) : super(key: key);

  final String cityName;

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context)
    ..fetchWeather(cityName);

    return Scaffold(
      appBar: AppBar(title:Text("Weather Details"),),
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherStates>(
          bloc: BlocProvider.of<WeatherCubit>(context),
          builder: (context, state) {
            if (state is WeatherLoading) return const CircularProgressIndicator();

            if(state is WeatherLoaded) return WeatherInformation(weatherModel: state.weatherModel);

            return const Text("some error occurred while fetching weather data");
          }
        )
      ),
    );
  }
}
