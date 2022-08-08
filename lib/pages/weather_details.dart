import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/widgets/weather_information.dart';

import '../states/pokemon_cubit.dart';
import '../states/pokemon_states.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({Key? key, required this.cityName}) : super(key: key);

  final String cityName;

  @override
  Widget build(BuildContext context) {
    PokemonCubit cubit = BlocProvider.of<PokemonCubit>(context)
      ..fetchWeather(cityName);

    return Scaffold(
      appBar: AppBar(title:Text("Weather Details"),),
      body: Center(
          child: BlocBuilder<PokemonCubit, PokemonStates>(
              bloc: BlocProvider.of<PokemonCubit>(context),
              builder: (context, state) {
                if (state is PokemonLoading) return const CircularProgressIndicator();

                if(state is PokemonLoaded) return PokemonInformation(pokemonModel: state.pokemonModel);

                return const Text("some error occurred while fetching weather data");
              }
          )
      ),
    );
  }
}