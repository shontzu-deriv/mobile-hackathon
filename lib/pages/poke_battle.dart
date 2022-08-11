import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_app/pages/versus_page.dart';
import '../models/pokemon_list_model.dart';
import '../states/pokemon_list_cubit.dart';
import '../states/pokemon_list_states.dart';

void searchPokemon(String query) {}

class PokeBattlePage extends StatefulWidget {
  const PokeBattlePage({Key? key}) : super(key: key);

  @override
  State<PokeBattlePage> createState() => _PokeBattlePageState();
}

class _PokeBattlePageState extends State<PokeBattlePage> {
  List<String> selected = List.empty(growable: true);
  List<Map<String, String>> pokemons = [];

  late TextEditingController _pokeController;
  bool _IsCheckEmpty = false;

  bool get canSelectMore => selected.length < 2;

  @override
  void initState() {
    super.initState();
    _pokeController = TextEditingController();
    setState(() {
      selected.clear();
      pokemons.clear();
    });
  }

  void didPop() {
    pokemons.clear();
  }

  @override
  Widget build(BuildContext context) {
    PokemonListCubit cubit = BlocProvider.of<PokemonListCubit>(context)
      ..fetchAllPokemonList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("CHOOSE TO BATTLE"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: _pokeController,
              textAlign: TextAlign.center,
              onChanged: (_) {
                setState(() {});
              },
              decoration: const InputDecoration(
                  prefixIcon: const Icon(Icons.search),
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
                      List<Result> toRender = _pokeController.text.isNotEmpty
                          ? List.from(
                              state.pokemonListModel.results.expand((element) {
                              if (element.name.contains(_pokeController.text)) {
                                return <Result>[element];
                              } else {
                                return <Result>[];
                              }
                            }))
                          : state.pokemonListModel.results;
                      return ListView.builder(
                          // Create grid with 2 columns (scrollDirection horizontal produces 2 rows)
                          // crossAxisCount: 1,
                          // Generate 100 widgets that display their index in the List.
                          itemCount: toRender.length,
                          itemBuilder: (_, i) {
                            Result element = toRender[i];
                            final rgx = RegExp(r"/([\d]+)[/]{0,1}$");
                            var id =
                                rgx.firstMatch(element.url)?.group(1) ?? "1";
                            return Card(
                              child: Row(
                                children: [
                                  ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxWidth: viewportWidth * 0.70),
                                      child: ListTile(
                                        leading: Image.network(
                                            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/${id}.gif"),
                                        title: Text(element.name),

                                        // subtitle:
                                      )),
                                  ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxWidth: viewportWidth * 0.10),
                                      child: Checkbox(
                                        checkColor: Colors.white,
                                        // fillColor: MaterialStateProperty.resolveWith(getColor),
                                        value: selected.contains(element.name),
                                        onChanged: (selected
                                                    .contains(element.name) ||
                                                canSelectMore)
                                            ? (bool? value) {
                                                setState(() {
                                                  if (value != null && value) {
                                                    selected.add(element.name);
                                                    pokemons.add({
                                                      'name': state
                                                          .pokemonListModel
                                                          .results[i]
                                                          .name
                                                          .toString(),
                                                      'image':
                                                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/${id}.gif"
                                                    });
                                                  } else {
                                                    selected
                                                        .remove(element.name);
                                                    pokemons.remove({
                                                      'name': state
                                                          .pokemonListModel
                                                          .results[i]
                                                          .name
                                                          .toString(),
                                                      'image':
                                                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/${id}.gif"
                                                    });
                                                  }
                                                });
                                              }
                                            : null,
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
        onPressed: canSelectMore
            ? null
            : () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VersusPage(selected: pokemons),
                    ));

                //HARD RESET ARRAY LIST USING TIMEOUT
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() {
                    selected = [];
                    pokemons = [];
                  });
                });
              },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
        ),
        child: const Text(
          "VERSUS",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
