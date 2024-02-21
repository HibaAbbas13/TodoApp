import 'dart:convert';

import 'package:flutter/material.dart';

class Todo {
  String? id;
  final String title;
  final String description;
  final String type;
  final String category;

  Todo({
    required this.title,
    required this.description,
    required this.type,
    required this.category,
  });
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'type': type,
      'category': category
    };
  }

  static Todo? fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Todo(
      title: map['title'],
      description: map['description'],
      type: map['type'],
      category: map['category'],
    );
  }

  String toJson() => json.encode(toMap());

  static Todo? fromJson(String source) => fromMap(json.decode(source));
}
