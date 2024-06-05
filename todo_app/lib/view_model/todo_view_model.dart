import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';


class TodoViewModel extends ChangeNotifier {
  final List<Todo> _todos = [];
  String _searchQuery = '';

  List<Todo> get todos {
    if (_searchQuery.isEmpty) {
      return _todos;
    } else {
      return _todos.where((todo) => todo.title.contains(_searchQuery)).toList();
    }
  }

  int get completedTasks => _todos.where((todo) => todo.isCompleted).length;

  void addTodo(String title) {
    _todos.add(Todo(
      title: title,
    ));
    notifyListeners();
  }

  void toggleCompletion(int index) {
    _todos[index].isCompleted = !_todos[index].isCompleted;
    notifyListeners();
  }

  void toggleFavourite(int index) {
    _todos[index].isFavourite = !_todos[index].isFavourite;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
