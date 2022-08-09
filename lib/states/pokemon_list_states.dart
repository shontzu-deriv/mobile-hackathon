import '../models/pokemon_list_model.dart';

abstract class PokemonListStates{}

class PokemonListLoading extends PokemonListStates{}

class PokemonListLoaded extends PokemonListStates{
  final PokemonListModel pokemonListModel;

  PokemonListLoaded({required this.pokemonListModel});
}

class PokemonListError extends PokemonListStates{
  final String errorMessage;
  PokemonListError({required this.errorMessage});
}