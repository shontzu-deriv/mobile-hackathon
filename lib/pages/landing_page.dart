import 'package:flutter/material.dart';
import 'poke_deck_page.dart';
import 'poke_battle.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'lib/background.jpg',
          ),
          fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.modulate,)
        ),
      ),

      child: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              alignment: Alignment.topCenter,
              height: 375,
              width: 375,
              image: AssetImage('lib/pokemon.png'),
            ),
            SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold  ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.black)
                        )
                    ),
                    
                    shadowColor: MaterialStateProperty.all(Colors.black)
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
                    style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.black)
                        )
                  ),

                ),
                ),
              ],
            ),

          ],
        ),
      ),
    ));
  }
}
