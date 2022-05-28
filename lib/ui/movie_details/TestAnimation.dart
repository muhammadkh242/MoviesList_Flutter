// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _width = 100; // the width at the beginning
  double _height = 100; // the height at the beginning
  Color _color = Colors.yellow; // the color at the beginning

  void _start() {
    setState(() {
      _width = 300;
      _height = 300;
      _color = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.black87,
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          width: _width,
          height: _height,
          decoration: BoxDecoration(shape: BoxShape.circle, color: _color),
          curve: Curves.decelerate,
          onEnd: () {
            setState(() {
              _width = _width == 100 ? 300 : 100;
              _height = _height == 100 ? 300 : 100;
              _color = _color == Colors.yellow ? Colors.red : Colors.yellow;
            });
          },
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
          onPressed: _start,
          icon: const Icon(Icons.run_circle),
          label: const Text('Start Infinite Pulsating')),
    );
  }
}