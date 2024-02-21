import 'package:flutter/material.dart';
import 'package:task_app/Model/Todolist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoProvider extends ChangeNotifier {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  List<Todo> todos = [];

  addTodo(Todo todo) async {
    await firebaseFirestore.collection('task').add({
      'title': todo.title,
      'description': todo.description,
      'type': todo.type,
      'category': todo.category,
    }).then((value) {
      todo.id = value.id;
      todos.add(todo);
      print('Length of todos: ${todos.length}');
    });
    notifyListeners();
  }

  deleteTodo(id) async {
    try {
      var index = todos.indexWhere((element) => element.id == id);
      if (index != -1) {
        await firebaseFirestore.collection('task').doc(id).delete();
        todos.removeAt(index);
      }
    } catch (e) {
      print('Error deleting todo: $e');
    }
    notifyListeners();
  }

  editTodo(Todo todo) async {
    if (todo == null || todo.id == null) {
      print('Invalid todo or todo id');
      return 'Not found';
    }

    try {
      var index = todos.indexWhere((element) => element.id == todo.id);
      if (index != -1) {
        await firebaseFirestore.collection('task').doc(todo.id).update({
          'title': todo.title,
          'description': todo.description,
          'type': todo.type,
          'category': todo.category,
        });
        todos[index] = todo;
      } else {
        print('Todo not found in the local list');
      }
    } catch (e) {
      print('Error updating todo: $e');
    }
    notifyListeners();
  }

  // After user authentication
}
