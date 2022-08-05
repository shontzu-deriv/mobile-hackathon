import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import 'package:flutter_weather_app/models/weather_model.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({required this.weatherModel, Key? key})
      : super(key: key);

  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(weatherModel.name, style: const TextStyle(fontSize: 50),),
              Image.network('http://openweathermap.org/img/wn/${weatherModel.weather.first.icon}@2x.png'),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("status:\n${weatherModel.weather.first.description}", textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, )),
              Text("humidity:\n${weatherModel.main.humidity.toString()} %", textAlign: TextAlign.center, style: const TextStyle(fontSize: 20,)),
              Text("pressure:\n${weatherModel.main.pressure.toString()} Pa", textAlign: TextAlign.center, style: const TextStyle(fontSize: 20)),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("feels like:\n${weatherModel.main.feelsLike.toString()} °C", textAlign: TextAlign.center, style: const TextStyle(fontSize: 20)),
              Text("actual:\n${weatherModel.main.temp} °C", textAlign: TextAlign.center,style: const TextStyle(fontSize: 20)),
            ],
          ),
        ],
      );
  }
}
