import 'dart:convert';

class Issue {
  int id;
  String title;
  String description;

  Issue({required this.id, required this.title, required this.description});

  factory Issue.fromJson(Map<String, dynamic> map) {
    return Issue(
      id: map["id"],
      title: map["title"],
      description: map["description"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
    };
  }

  List<Issue> toList(String jsonData) {
    final data = json.decode(jsonData);
    return List<Issue>.from(data.map((item) => Issue.fromJson(item)));
  }
}
