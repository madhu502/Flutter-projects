import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
        onDoubleTap: () {
          print("I'm Clicked");
        },
        child: const Text('Tap Me'),
      )),
    );
  }
}
