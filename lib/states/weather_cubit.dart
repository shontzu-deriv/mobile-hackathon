import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/weather_model.dart';
import 'package:flutter_weather_app/services/weather_services.dart';
import 'package:flutter_weather_app/states/weather_states.dart';


class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherLoading());

  //function for fetching data from server
  Future<void> fetchWeather(String cityName) async {
    WeatherService weatherService = WeatherService();

    try {
      WeatherModel weatherModel = await weatherService.fetchWeatherInformation(
          cityName);
      emit(WeatherLoaded(weatherModel: weatherModel));
      }catch(e)
      {
        emit(WeatherError(errorMessage: e.toString()));
      }
    }

}