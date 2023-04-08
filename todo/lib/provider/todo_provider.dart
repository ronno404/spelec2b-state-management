import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _items = [];
  UnmodifiableListView<Todo> get items => UnmodifiableListView(_items);

  void add(Todo item) {
    _items.add(item);
    notifyListeners();
  }

  void remove({required Todo item}) {
    if (_items.contains(item)) {
      _items.remove(item);
      notifyListeners();
    }
  }
}
