import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class ActionSchema {
  String? id;
  String title;
  String description;
  String category;
  String status;
  String assignedTo;
  DateTime dueDate;
  DateTime created;
  DateTime updated;

  ActionSchema({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.assignedTo,
    required this.dueDate,
    required this.created,
    required this.updated,
  });

  factory ActionSchema.fromJson(dynamic doc) {
    return ActionSchema(
      id: doc.id,
      title: doc["title"],
      description: doc["description"],
      category: doc["category"],
      status: doc["status"],
      assignedTo: doc["assignedTo"],
      dueDate: (doc['dueDate'] as Timestamp).toDate(),
      created: (doc['created'] as Timestamp).toDate(),
      updated: (doc['updated'] as Timestamp).toDate(),
    );
  }

  List<ActionSchema> toList(String jsonData) {
    final data = json.decode(jsonData);
    return List<ActionSchema>.from(
        data.map((item) => ActionSchema.fromJson(item)));
  }
}
