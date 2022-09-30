import 'dart:convert';

class Action {
  int id;
  String? title;
  String? description;

  Action({required this.id, required this.title, required this.description});

  factory Action.fromJson(Map<String, dynamic> map) {
    return Action(
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

  List<Action> toList(String jsonData) {
    final data = json.decode(jsonData);
    return List<Action>.from(data.map((item) => Action.fromJson(item)));
  }
}
