import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_app/services/pokemon_list_services.dart';
import 'package:flutter_pokemon_app/states/pokemon_list_states.dart';
import 'package:flutter_pokemon_app/models/pokemon_list_model.dart';

class PokemonListCubit extends Cubit<PokemonListStates> {
  PokemonListCubit() : super(PokemonListLoading());

  Future<void> fetchAllPokemonList() async {
    PokemonListService pokemonListService = PokemonListService();

    try {
      PokemonListModel pokemonListModel =
          await PokemonListService().fetchAllPokemon();
      emit(PokemonListLoaded(pokemonListModel: pokemonListModel));
    } catch (e) {
      print(e);
      emit(PokemonListError(errorMessage: e.toString()));
    }
  }
}
