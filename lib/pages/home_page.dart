import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/pages/pokemon_details.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Pokemon App"))),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: TextField(
          controller: _pokeController,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
              label: Text("Search Pokemon"),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green))),
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
