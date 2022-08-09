import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/pokemon_list_cubit.dart';
import '../states/pokemon_list_states.dart';
import '../pages/pokemon_details.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<int> selected=List.empty(growable: true);
  late TextEditingController _pokeController;
  bool get canSelectMore=>selected.length<2;

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
                      final double viewportWidth =
                          MediaQuery.of(context).size.width;
                      return ListView.builder(
                          // Create grid with 2 columns (scrollDirection horizontal produces 2 rows)
                          // crossAxisCount: 1,
                          // Generate 100 widgets that display their index in the List.
                          itemCount: state.pokemonListModel.results.length,
                          itemBuilder: (_, i) {
                            return Card(
                              child: Row(
                                children: [
                                  ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxWidth: viewportWidth * 0.70),
                                      child:  ListTile(

                                          leading:  Image.network(
                                              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/${i + 1}.gif"),
                                          title: Text(state.pokemonListModel.results[i].name),

                                          // subtitle:
                                      )),

                                  ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxWidth: viewportWidth * 0.10),
                                      child: Checkbox(
                                        checkColor: Colors.white,
                                        // fillColor: MaterialStateProperty.resolveWith(getColor),
                                        value: selected.contains(i),
                                        onChanged:(selected.contains(i)||canSelectMore)? (bool? value) {
                                          setState(() {
                                              if(value!=null&&value){
                                                selected.add(i);
                                              }
                                              else{
                                                selected.remove(i);
                                              }
                                          });
                                        }:null,
                                      ))
                                ],
                              ),
                            );
                          });
                      // );
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
                builder: (context) => PokemonDetails(
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
