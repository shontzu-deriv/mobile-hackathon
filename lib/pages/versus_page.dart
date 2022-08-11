import 'package:flutter/material.dart';

class VersusPage extends StatefulWidget {
  final List<Map<String, String>> selected;
  const VersusPage({Key? key, required this.selected}) : super(key: key);

  void didPop() {
    selected.clear();
  }

  @override
  State<VersusPage> createState() => _VersusPageState();
}

class _VersusPageState extends State<VersusPage> {
  late TextEditingController _pokeController;

  @override
  void initState() {
    super.initState();
    _pokeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BATTLE"),
          centerTitle: true,
        ),
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
