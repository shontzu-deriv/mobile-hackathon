import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../states/pokemon_list_cubit.dart';
import '../states/pokemon_list_states.dart';
import 'home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PokemonListCubit cubit = BlocProvider.of<PokemonListCubit>(context)
      ..fetchAllPokemonList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon App"),
      ),
      body: Center(
          child: BlocBuilder<PokemonListCubit, PokemonListStates>(
              bloc: BlocProvider.of<PokemonListCubit>(context),
              builder: (context, state) {
                if (state is PokemonListLoading)
                  return const CircularProgressIndicator();

                if (state is PokemonListLoaded) {
                  return Column(
                    children: [
                      Text("fetch success"),
                      Text("${state.pokemonListModel.results[4].name}")
                    ],
                  );
                }

                return const Text(
                    "some error occurred while fetching the data");
              })),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Homepage(),
              ));
        },
        child: const Text(
          "POKEMON WAR",
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
