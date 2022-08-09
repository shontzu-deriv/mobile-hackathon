import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../states/pokemon_cubit.dart';
import '../states/pokemon_list_cubit.dart';
import '../states/pokemon_list_states.dart';
import '../pages/pokemon_details.dart';
import '../states/pokemon_states.dart';
import '../widgets/pokemon_information.dart';
import 'home_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  late TextEditingController _pokeController;

  @override
  void initState() {
    super.initState();
    _pokeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    PokemonListCubit cubit = BlocProvider.of<PokemonListCubit>(context)
      ..fetchAllPokemonList();

    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Pokemon App"))),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: _pokeController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  label: Text("Search Pokemon"),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green))),
            ),
            Expanded(
              child: BlocBuilder<PokemonListCubit, PokemonListStates>(
                  bloc: BlocProvider.of<PokemonListCubit>(context),
                  builder: (context, state) {
                    if (state is PokemonListLoading)
                      return const CircularProgressIndicator();

                    if (state is PokemonListLoaded) {
                      return ListView(
                        // Create grid with 2 columns (scrollDirection horizontal produces 2 rows)
                        // crossAxisCount: 1,
                        // Generate 100 widgets that display their index in the List.
                        children: List.generate(
                            state.pokemonListModel.results.length, (i) {
                          return Card(
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,

                              children: <Widget>[
                                const ListTile(
                                  leading: Icon(Icons.album, size: 45),
                                  title: Text('Sonu Nigam'),
                                  subtitle: Text('Best of Sonu Nigam Song'),
                                ),
                              ],
                            ),
                          );
                        }),
                      );
                      // ); // Text("${state.pokemonListModel.results[4].name}")
                    }

                    return const Text(
                        "some error occurred while fetching the pokemons");
                  }),
            ),
          ],
        ),
      ),


      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PokemonDetails(
                      pokeId: _pokeController.text,
                    ),
              ));
        },
        child: const Text(
          "VERSUS",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}