
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
  bool isChecked = false;
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
                      final double viewportWidth=MediaQuery.of(context).size.width;
                      return ListView(
                        // Create grid with 2 columns (scrollDirection horizontal produces 2 rows)
                        // crossAxisCount: 1,
                        // Generate 100 widgets that display their index in the List.
                        children: List.generate(
                            state.pokemonListModel.results.length, (i) {
                          return Card(
                            child: Row(
                              children: [
                                ConstrainedBox(constraints: BoxConstraints(maxWidth: viewportWidth*0.70),child:const ListTile(
                                  leading: Icon(Icons.album, size: 45),
                                  // title: Text('${state.pokemonListModel.results[i].name}'),

                                  subtitle: Text('Best of Sonu Nigam Song')
                                )),
                          // Color getColor(Set<MaterialState> states) {
                          // const Set<MaterialState> interactiveStates = <MaterialState>{
                          // MaterialState.pressed,
                          // MaterialState.hovered,
                          // MaterialState.focused,
                          // };
                          // if (states.any(interactiveStates.contains)) {
                          // return Colors.blue;
                          // }
                          // return Colors.red;
                          // }
                          ConstrainedBox(constraints: BoxConstraints(maxWidth: viewportWidth*0.10),child:
                           Checkbox(
                          checkColor: Colors.white,
                          // fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: isChecked,
                          onChanged: (bool? value) {
                          setState(() {
                          isChecked = value!;
                          });
                          },
                          ))
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