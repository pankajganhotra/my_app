import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Issue {
  String? id;
  String title;
  String description;
  String category;
  String status;
  DateTime created;
  DateTime updated;

  Issue({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.created,
    required this.updated,
  });

  factory Issue.fromJson(dynamic doc) {
    return Issue(
      id: doc.id,
      title: doc["title"],
      description: doc["description"],
      category: doc["category"],
      status: doc["status"],
      created: (doc['created'] as Timestamp).toDate(),
      updated: (doc['updated'] as Timestamp).toDate(),
    );
  }

  List<Issue> toList(String jsonData) {
    final data = json.decode(jsonData);
    return List<Issue>.from(data.map((item) => Issue.fromJson(item)));
  }
}
