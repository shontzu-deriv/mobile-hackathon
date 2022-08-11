import 'package:flutter/material.dart';
import 'almanac_page.dart';
import 'list_page.dart';

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
                  builder: (context) => const AlmanacPage(),
                ));
          },
          child: const Text(
            "ALMANAC",
            style: TextStyle(fontSize: 20),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListPage(),
                ));
          },
          child: const Text(
            "BATTLE",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    ));
  }
}
