import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
  // late TextEditingController _pokeController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // _pokeController = TextEditingController();
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
                  image: NetworkImage('https://img.freepik.com/free-vector/flat-comic-style-background_23-2148818641.jpg?w=2000'),
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
                    ),),
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
                  image: NetworkImage('https://img.freepik.com/premium-vector/blue-comic-retro-burst-background_92086-478.jpg?w=2000'),
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
                              '${widget.selected[1]['name']}'
                          ),
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

// class VersusPage extends StatefulWidget {
//   const VersusPage({Key? key}) : super(key: key);
//
//   @override
//   State<VersusPage> createState() => _VersusPageState();
// }
//
// class _VersusPageState extends State<VersusPage> {
//   bool selected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 200,
//       height: 350,
//       child: Stack(
//         children: <Widget>[
//           AnimatedPositioned(
//             width: selected ? 500.0 : 5.0,
//             height: selected ? 200.0 : 200.0,
//             duration: const Duration(seconds: 2),
//             curve: Curves.fastOutSlowIn,
//             child: GestureDetector(
//               onTap: () {
//     setState(() {
//             selected =! selected;
//            });
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.pink,
//                 ),
//               ),
//             ),
//           ),
//           AnimatedPositioned(
//             width: selected ? 500.0 : 5.0,
//             height: selected ? 200.0 : 200.0,
//             duration: const Duration(seconds: 2),
//             curve: Curves.fastOutSlowIn,
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selected =! selected;
//                 });
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           AnimatedPositioned(
//             width: selected ? 500.0 : 5.0,
//             height: selected ? 200.0 : 200.0,
//             duration: const Duration(seconds: 2),
//             curve: Curves.fastOutSlowIn,
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selected =! selected;
//                 });
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//     return SizedBox(
//       width: 200,
//       height: 350,
//       child: Stack(
//         children: <Widget>[
//           AnimatedPositioned(
//             width: selected ? 500.0 : 5.0,
//             height: selected ? 200.0 : 200.0,
//             duration: const Duration(seconds: 2),
//             curve: Curves.fastOutSlowIn,
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selected =! selected;
//                 });
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.pink,
//                 ),
//               ),
//             ),
//           ),
//           AnimatedPositioned(
//             width: selected ? 500.0 : 5.0,
//             height: selected ? 200.0 : 200.0,
//             duration: const Duration(seconds: 2),
//             curve: Curves.fastOutSlowIn,
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selected =! selected;
//                 });
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//           AnimatedPositioned(
//             width: selected ? 500.0 : 5.0,
//             height: selected ? 200.0 : 200.0,
//             duration: const Duration(seconds: 2),
//             curve: Curves.fastOutSlowIn,
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selected =! selected;
//                 });
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
