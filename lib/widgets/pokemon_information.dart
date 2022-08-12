import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';

class PokemonInformation extends StatelessWidget {
  const PokemonInformation({required this.pokemonModel, Key? key})
      : super(key: key);

  final PokemonModel pokemonModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (pokemonModel.name).toString(),
              style: const TextStyle(fontSize: 50),
            ),
            Text(
              (pokemonModel.baseExperience).toString(),
              style: const TextStyle(fontSize: 50),
            ),
          ],
        ),
      ],
    );
  }
}
