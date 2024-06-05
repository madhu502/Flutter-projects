import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/app.dart';
// import 'package:todo_app/view%20model/todo_viewmodel.dart';
import 'package:todo_app/view_model/todo_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoViewModel(),
      child: const App(),
    ),
  );
}
