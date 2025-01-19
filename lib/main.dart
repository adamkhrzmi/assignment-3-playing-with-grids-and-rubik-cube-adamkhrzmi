
import 'package:flutter/material.dart';

void main() {
  runApp(const RubikCubeApp());
}

class RubikCubeApp extends StatelessWidget {
  const RubikCubeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RubikCubeScreen(),
    );
  }
}

class RubikCubeScreen extends StatefulWidget {
  @override
  _RubikCubeScreenState createState() => _RubikCubeScreenState();
}

class _RubikCubeScreenState extends State<RubikCubeScreen> {
  // Initialize cube faces with colors
  List<List<Color>> cubeFaces = [
    List.filled(4, Colors.white), // Front
    List.filled(4, Colors.yellow), // Back
    List.filled(4, Colors.red), // Left
    List.filled(4, Colors.orange), // Right
    List.filled(4, Colors.green), // Top
    List.filled(4, Colors.blue), // Bottom
  ];

  // Rotate a face clockwise
  void rotateFaceClockwise(int faceIndex) {
    setState(() {
      var face = cubeFaces[faceIndex];
      cubeFaces[faceIndex] = [face[2], face[0], face[3], face[1]];
    });
  }

  // Rotate a face counterclockwise
  void rotateFaceCounterclockwise(int faceIndex) {
    setState(() {
      var face = cubeFaces[faceIndex];
      cubeFaces[faceIndex] = [face[1], face[3], face[0], face[2]];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2x2 Rubik Cube'),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 4,
                child: AspectRatio(
                  aspectRatio: 1, // Ensure the grid is a square
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        color: cubeFaces[0][index],
                        margin: const EdgeInsets.all(4),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => rotateFaceClockwise(0),
                          child: const Text('Rotate Front Clockwise'),
                        ),
                        ElevatedButton(
                          onPressed: () => rotateFaceCounterclockwise(0),
                          child: const Text('Rotate Front Counterclockwise'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => rotateFaceClockwise(4),
                          child: const Text('Rotate Top Clockwise'),
                        ),
                        ElevatedButton(
                          onPressed: () => rotateFaceCounterclockwise(4),
                          child: const Text('Rotate Top Counterclockwise'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

