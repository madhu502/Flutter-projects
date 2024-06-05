import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/model/todo_model.dart';

import 'package:todo_app/view_model/todo_view_model.dart';

class MyTodoApp extends StatefulWidget {
  const MyTodoApp({super.key});

  @override
  State<MyTodoApp> createState() => _MyTodoAppState();
}

class _MyTodoAppState extends State<MyTodoApp>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todoViewModel = Provider.of<TodoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Todopad'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Active'),
            Tab(text: 'Favourite'),
            Tab(text: 'Done'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                todoViewModel.setSearchQuery(value);
              },
              decoration: const InputDecoration(
                labelText: 'What do you want to do?',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            Text(
                '${todoViewModel.completedTasks} of ${todoViewModel.todos.length} tasks completed'),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  buildTodoList(todoViewModel.todos),
                  buildTodoList(todoViewModel.todos
                      .where((todo) => !todo.isCompleted)
                      .toList()),
                  buildTodoList(todoViewModel.todos
                      .where((todo) => todo.isFavourite)
                      .toList()),
                  buildTodoList(todoViewModel.todos
                      .where((todo) => todo.isCompleted)
                      .toList()),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayAddTodoDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildTodoList(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return ListTile(
          title: Text(todo.title),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  todo.isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: todo.isFavourite ? Colors.red : null,
                ),
                onPressed: () {
                  Provider.of<TodoViewModel>(context, listen: false)
                      .toggleFavourite(index);
                },
              ),
              Checkbox(
                value: todo.isCompleted,
                onChanged: (value) {
                  Provider.of<TodoViewModel>(context, listen: false)
                      .toggleCompletion(index);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _displayAddTodoDialog(BuildContext context) async {
    final todoViewModel = Provider.of<TodoViewModel>(context, listen: false);
    TextEditingController textFieldController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add a new task'),
          content: TextField(
            controller: textFieldController,
            decoration: const InputDecoration(hintText: "Enter task title"),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Add'),
              onPressed: () {
                todoViewModel.addTodo(textFieldController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
