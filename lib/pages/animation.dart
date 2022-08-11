import 'package:flutter/cupertino.dart';

class Anime extends StatefulWidget {
  const Anime({Key? key}) : super(key: key);

  @override
  State<Anime> createState() => _AnimeState();
}

class _AnimeState extends State<Anime>with SingleTickerProviderStateMixin {
  late AnimationController animationController =
  AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat(reverse: true);
  late Animation<double> animation =
  CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);
  @override
  Widget build(BuildContext context) {
    return


    ScaleTransition(
        alignment: Alignment.topCenter,
        scale: animation,
        child: Image.asset('lib/pokemon.png',height: 375,width: 375,)
    );
  }
}
