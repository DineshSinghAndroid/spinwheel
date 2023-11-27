import 'dart:math';

import 'package:flutter/material.dart';


class SpinWheelGame extends StatefulWidget {
  @override
  _SpinWheelGameState createState() => _SpinWheelGameState();
}

class _SpinWheelGameState extends State<SpinWheelGame> {
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  List<Color> spinResult = [];

  void spinWheel() {
    spinResult.clear();
    for (int i = 0; i < 3; i++) {
      final randomColor = colors[Random().nextInt(colors.length)];
      spinResult.add(randomColor);
    }
    // Add the winners to a list or perform any other action based on the result.
    print('Winners: $spinResult');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spin Wheel Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2.0),
                gradient: RadialGradient(
                  colors: spinResult.isEmpty
                      ? [Colors.grey, Colors.grey]
                      : spinResult,
                  stops: [0.2, 1.0],
                ),
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    spinWheel();
                  },
                  child: Text('Spin'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Tap "Spin" to play the game!',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
