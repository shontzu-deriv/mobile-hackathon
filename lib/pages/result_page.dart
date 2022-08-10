import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/pages/pokemon_details.dart';

class Resultpage extends StatefulWidget {
  const Resultpage({Key? key}) : super(key: key);

  @override
  State<Resultpage> createState() => _ResultpageState();
}

class _ResultpageState extends State<Resultpage> {

  late TextEditingController _pokeController;

  @override
  void initState() {
    super.initState();
    _pokeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Poke Battle"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.pink,
            width: 410,
            height: 200,
            child: Center(
              child: Image.network(''),
            ),
          ),

          Container(
            color: Colors.white,
            width: 410,
            height: 200,
            child: Center(
              child: Image.network('https://media.baamboozle.com/uploads/images/417119/1628139419_225816_gif-url.gif'),
            ),
          ),

            Container(
              color: Colors.blue,
              width: 410,
              height: 200,
              child: Center(
                  child: Image.network(''),
              ),
          )
          ]
        ),
      )
    );
  }
}
