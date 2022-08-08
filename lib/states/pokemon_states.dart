import '../models/pokemon_model.dart';

abstract class PokemonStates{}

class PokemonLoading extends PokemonStates{}

class PokemonLoaded extends PokemonStates{
  final PokemonModel pokemonModel;

  PokemonLoaded({required this.pokemonModel});
}

class PokemonError extends PokemonStates{
  final String errorMessage;
  PokemonError({required this.errorMessage});
}