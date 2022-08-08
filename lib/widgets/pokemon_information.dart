import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';

class PokemonInformation extends StatelessWidget {
  const PokemonInformation({required this.pokemonModel, Key? key})
      : super(key: key);

  final PokemonModel pokemonModel;
  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(pokemonModel.name, style: const TextStyle(fontSize: 50),),
              Text((pokemonModel.baseExperience).toString(), style: const TextStyle(fontSize: 50),),
              // Image.network('http://openweathermap.org/img/wn/${weatherModel.weather.first.icon}@2x.png'),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Text("status:\n${weatherModel.weather.first.description}", textAlign: TextAlign.center, style: const TextStyle(fontSize: 20, )),
              // Text("humidity:\n${weatherModel.main.humidity.toString()} %", textAlign: TextAlign.center, style: const TextStyle(fontSize: 20,)),
              // Text("pressure:\n${weatherModel.main.pressure.toString()} Pa", textAlign: TextAlign.center, style: const TextStyle(fontSize: 20)),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Text("feels like:\n${weatherModel.main.feelsLike.toString()} °C", textAlign: TextAlign.center, style: const TextStyle(fontSize: 20)),
              // Text("actual:\n${weatherModel.main.temp} °C", textAlign: TextAlign.center,style: const TextStyle(fontSize: 20)),
            ],
          ),
        ],
      );
  }
}
