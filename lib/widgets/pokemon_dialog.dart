import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

//states for the modal (inlined cubit)
enum _LoaderStates { init, loading, failed, loaded }

///
///  Show the dialog about the ability of the pokemon
///  referred by its `url`
///
void showPokemonDialog(BuildContext ctx, final String url) {
  //states goes here
  _LoaderStates state = _LoaderStates.init;
  PokemonModel? data;
  showDialog(
    context: ctx,
    builder: (context) => AlertDialog(
      content: SizedBox(
        height: 300,
        child: StatefulBuilder(
          builder: (context, setState) {
            //fire the async stuff here
            Future<void> loadData() async {
              state = _LoaderStates.loading;
              try {
                Uri endpoint = Uri.parse(url);
                http.Response response = await http.get(endpoint);

                if (response.statusCode == 200 /*ok*/) {
                  data = PokemonModel.fromJson(response.body);
                  setState(() {
                    state = _LoaderStates.loaded;
                  });
                } else {
                  throw Exception("Request failed");
                }
              } catch (e, st) {
                print(e);
                print(st);
                setState(() {
                  _LoaderStates.failed;
                });
              }
            }

            if (state == _LoaderStates.init) {
              loadData();
            }
            assert(state != _LoaderStates.init);
            switch (state) {
              case _LoaderStates.loading:
                return const Center(child: CircularProgressIndicator());
              case _LoaderStates.loaded:
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      (data!.name).toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const Divider(color: Colors.black),
                    Row(
                      children: [
                        Image.network((data!.sprites.frontDefault).toString()),
                        Column(
                          children: [
                            const Text("ABILITIES",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text((data!.abilities[0].ability.name).toString()),
                            Text((data!.abilities[1].ability.name).toString()),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text("EXP: ${(data!.baseExperience).toString()}"),
                    LinearProgressIndicator(
                      value: (data!.baseExperience.toDouble()) / 600,
                    ),
                    const SizedBox(height: 20),
                    Text("HEIGHT: ${(data!.height).toString()}"),
                    LinearProgressIndicator(
                      value: (data!.height.toDouble()) / 50,
                    ),
                    const SizedBox(height: 20),
                    Text("WEIGHT: ${(data!.weight).toString()}"),
                    LinearProgressIndicator(
                      value: (data!.weight.toDouble()) / 1000,
                    ),
                  ],
                );
              case _LoaderStates.failed:
                return const Text("something messed up");
            }
            return Container();
          },
        ),
      ),
    ),
  );
}
