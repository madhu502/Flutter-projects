import 'package:flutter/material.dart';

import 'package:todo_app/view/todo_app_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyTodoApp(),
    );
  }
}
