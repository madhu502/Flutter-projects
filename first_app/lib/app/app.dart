
import 'package:first_app/screens/bottom_screen/dashboard_screen.dart';
import 'package:first_app/screens/flexible_expanded_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}
