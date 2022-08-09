import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../states/pokemon_cubit.dart';
import '../states/pokemon_states.dart';
import '../widgets/pokemon_information.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({Key? key, required this.pokeId}) : super(key: key);

  final String pokeId;

  @override
  Widget build(BuildContext context) {
    PokemonCubit cubit = BlocProvider.of<PokemonCubit>(context)
      ..fetchPokemons(pokeId);

    return Scaffold(
      appBar: AppBar(title:Text("Pokemon Versus"),),
      body: Center(
          child: BlocBuilder<PokemonCubit, PokemonStates>(
              bloc: BlocProvider.of<PokemonCubit>(context),
              builder: (context, state) {
                if (state is PokemonLoading) return const CircularProgressIndicator();

                if(state is PokemonLoaded) return PokemonInformation(pokemonModel: state.pokemonModel);

                return const Text("some error occurred while fetching the data");
              }
          )
      ),
    );
  }
}