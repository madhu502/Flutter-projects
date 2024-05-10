import 'package:flutter/material.dart';
import 'package:swap_two_numbers/screens/swap_two_numbers.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SwapNumbers(),
    );
  }
}
