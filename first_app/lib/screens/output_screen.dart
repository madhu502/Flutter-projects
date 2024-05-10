import 'package:flutter/material.dart';

class OutputScreen extends StatelessWidget {
  final String title;
  const OutputScreen({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Text(
          "Hello $title!",
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
