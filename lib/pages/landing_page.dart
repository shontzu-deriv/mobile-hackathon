import 'package:flutter/material.dart';
import 'poke_deck_page.dart';
import 'poke_battle.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PokeDeckPage(),
                ));
          },
          child: const Text(
            "POKE DECK",
            style: TextStyle(fontSize: 20),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PokeBattlePage(),
                ));
          },
          child: const Text(
            "POKE BATTLE",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    ));
  }
}
