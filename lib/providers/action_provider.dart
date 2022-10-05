import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:my_app/schema/action_schema.dart';

class ActionProvider with ChangeNotifier, DiagnosticableTreeMixin {
  static var ActionsRef = FirebaseFirestore.instance.collection("actions");
  final List<ActionSchema> _list = [];

  List<ActionSchema> get list => _list;

  Future<void> fetchList() async {
    QuerySnapshot snaps = await ActionsRef.get();
    _list.clear();
    snaps.docs.forEach((doc) {
      _list.add(ActionSchema.fromJson(doc));
    });
    print(_list.length);
    notifyListeners();
  }

  void fetchOne() {}

  Future<void> createOne(data) async {
    print("Fire $data");
    try {
      var docRef = await ActionsRef.add(data);
      var doc = await docRef.get();
      _list.add(ActionSchema.fromJson(doc));
      notifyListeners();
    } on PlatformException {
      print("object");
    } catch (err) {
      print(err);
    }
  }

  void updateOne() {}
}
