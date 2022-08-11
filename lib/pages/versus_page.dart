import 'package:flutter/material.dart';
import 'package:flutter_pokemon_app/pages/battle_page.dart';

class Resultpage extends StatefulWidget {
  final List<Map<String, String>> selected;
  const Resultpage({Key? key, required this.selected}) : super(key: key);
  //widget.selected[0]
  //widget.selected[1]
  //selected.clear()

  void didPop() {
    selected.clear();
  }

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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              color: Colors.pink,
              width: 410,
              height: 200,
              child: Center(
                child: Column(
                  children: <Widget>[
                    FittedBox(
                      child: Image.network(
                        '${widget.selected[0]['image']}',
                        fit: BoxFit.fill,
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Text('${widget.selected[0]['name']}')
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: 410,
              height: 200,
              child: Center(
                child: Image.network(
                    'https://media.baamboozle.com/uploads/images/417119/1628139419_225816_gif-url.gif'),
              ),
            ),
            Container(
              color: Colors.blue,
              width: 410,
              height: 200,
              child: Center(
                child: Column(
                  children: <Widget>[
                    FittedBox(
                      child: Image.network(
                        '${widget.selected[1]['image']}',
                        fit: BoxFit.fill,
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Text('${widget.selected[1]['name']}')
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
