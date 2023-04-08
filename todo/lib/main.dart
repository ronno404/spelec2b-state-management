import 'package:flutter/material.dart';
import 'package:todo/provider/todo_provider.dart';
import 'package:todo/widgets/todo_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: const MaterialApp(
        title: 'My Todo App',
        home: TodoPage(),
      ),
    ),
  );
}
