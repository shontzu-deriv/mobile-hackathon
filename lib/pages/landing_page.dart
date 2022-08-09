import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../states/pokemon_cubit.dart';
import '../states/pokemon_list_cubit.dart';
import '../states/pokemon_list_states.dart';
import '../states/pokemon_states.dart';
import '../widgets/pokemon_information.dart';
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
                  return GridView.count(
                    // Create grid with 2 columns (scrollDirection horizontal produces 2 rows)
                    crossAxisCount: 2,
                    // Generate 100 widgets that display their index in the List.
                    children: List.generate(
                        state.pokemonListModel.results.length, (i) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title:
                                  Text(state.pokemonListModel.results[i].name),
                              content:
                                  Text(state.pokemonListModel.results[i].name),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(14),
                                    child: const Text("close"),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Card(
                          // color: Colors.orange[200],
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: EdgeInsets.all(10.0),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                      "${state.pokemonListModel.results[i].name}"),
                                ),
                                Image.network(
                                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/${i + 1}.gif",
                                  // height: 100,
                                  // width: 100,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ); // Text("${state.pokemonListModel.results[4].name}")
                }

                return const Text(
                    "some error occurred while fetching the pokemons");
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
          "BATTLE",
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_pokemon_app/pages/home_page.dart';
//
// class LandingPage extends StatefulWidget {
//   const LandingPage({Key? key}) : super(key: key);
//
//   @override
//   State<LandingPage> createState() => _LandingPageState();
// }
//
// class _LandingPageState extends State<LandingPage> {
//   late TextEditingController _pokeController;
//
//   @override
//   void initState() {
//     super.initState();
//     _pokeController = TextEditingController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Center(child: Text("Pokemon App"))),
//       body: GridView.count(
//         // Create grid with 2 columns (scrollDirection horizontal produces 2 rows)
//         crossAxisCount: 2,
//         // Generate 100 widgets that display their index in the List.
//         children: List.generate(100, (index) {
//           return Card(
//             // color: Colors.orange[200],
//             shape: RoundedRectangleBorder(
//               side: BorderSide(color: Colors.grey, width: 0.5),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             margin: EdgeInsets.all(10.0),
//             child: Container(
//               child: Column(
//                 children: <Widget>[
//                   ListTile(
//                     title: Text(
//                       'Pokemon $index',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }),
//       ),
//       floatingActionButton: ElevatedButton(
//         onPressed: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const Homepage(),
//               ));
//         },
//         child: const Text(
//           "POKEMON WAR",
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
