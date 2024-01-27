import 'dart:convert';

class ChatSchema {
  String? id;
  String? issueId;
  String? actionId;
  String? text;
  String? attachments;

  ChatSchema({
    this.id,
    this.issueId,
    this.actionId,
    this.text,
    this.attachments,
  });

  factory ChatSchema.fromJson(dynamic doc) {
    return ChatSchema(
      id: doc.id,
      issueId: doc["issueId"],
      actionId: doc["actionId"],
      text: doc["text"],
      attachments: doc["attachments"],
    );
  }

  List<ChatSchema> toList(String jsonData) {
    final data = json.decode(jsonData);
    return List<ChatSchema>.from(data.map((item) => ChatSchema.fromJson(item)));
  }
}
