import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_app/states/pokemon_states.dart';
import '../models/pokemon_model.dart';
import '../services/pokemon_services.dart';


class PokemonCubit extends Cubit<PokemonStates> {
  PokemonCubit() : super(PokemonLoading());

  //function for fetching data from server
  Future<void> fetchPokemon(/*String pokeId*/) async {
    PokemonService pokemonService = PokemonService();

    try {
      PokemonModel pokemonModel = await pokemonService.fetchPokemons(/*pokeId*/);
      emit(PokemonLoaded(pokemonModel: pokemonModel));
      }catch(e)
      {
        print(e);
        emit(PokemonError(errorMessage: e.toString()));
      }
    }

}