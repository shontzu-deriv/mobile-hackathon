import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../states/pokemon_cubit.dart';

class VersusPage extends StatefulWidget {
  final List<Map<String, String>> selected;

  const VersusPage({Key? key, required this.selected}) : super(key: key);

  void didPop() {
    selected.clear();
  }

  @override
  State<VersusPage> createState() => _VersusPageState();
}

class _VersusPageState extends State<VersusPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 1,
        ),
        lowerBound: 0,
        upperBound: 1);
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    PokemonCubit cubit = BlocProvider.of<PokemonCubit>(context)
      ..fetchPokemons('1');

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("BATTLE"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://img.freepik.com/free-vector/flat-comic-style-background_23-2148818641.jpg?w=2000'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(
                        -(size.width * 0.66 * (1 - _animationController.value)),
                        0),
                    child: FittedBox(
                      child: Image.network(
                        '${widget.selected[0]['image']}',
                        fit: BoxFit.fill,
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agne',
                        color: Colors.white,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                              ' ${widget.selected[0]['name']}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              width: 410,
              height: 180,
              child: Center(
                child: Image.network(
                    'https://media.baamboozle.com/uploads/images/417119/1628139419_225816_gif-url.gif'),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://img.freepik.com/premium-vector/blue-comic-retro-burst-background_92086-478.jpg?w=2000'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Agne',
                        color: Colors.white,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                              '${widget.selected[1]['name']}'),
                        ],
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                        (size.width * 0.66 * (1 - _animationController.value)),
                        0),
                    child: FittedBox(
                      child: Image.network(
                        '${widget.selected[1]['image']}',
                        fit: BoxFit.fill,
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
