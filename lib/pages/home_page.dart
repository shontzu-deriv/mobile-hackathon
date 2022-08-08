import 'package:flutter/material.dart';
import 'package:flutter_weather_app/pages/weather_details.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _inputIsEmpty = true;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
    _controller.addListener(() {
      if (_controller.text != '') setState(() => _inputIsEmpty = false);
      if (_controller.text == '') setState(() => _inputIsEmpty = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("My Weather App"))),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Enter City Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              TextField(
                maxLength: 20,
                controller: _controller,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    label: Text("City name"),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _inputIsEmpty
                    ? null
                    : () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PokemonDetails(
                                cityName: _controller.text,
                              ),
                            ));
                      },
                child: const Text("check weather"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
