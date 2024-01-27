import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:my_app/schema/issue_schema.dart';

class IssueProvider with ChangeNotifier, DiagnosticableTreeMixin {
  static var issuesRef = FirebaseFirestore.instance.collection("issues");
  final List<Issue> _list = [];

  List<Issue> get list => _list;

  Future<void> fetchList() async {
    QuerySnapshot snaps = await issuesRef.get();
    _list.clear();
    snaps.docs.forEach((doc) {
      _list.add(Issue.fromJson(doc));
    });
    print(_list.length);
    notifyListeners();
  }

  void fetchOne() {}

  Future<void> createOne(data) async {
    print("Fire $data");
    try {
      var docRef = await issuesRef.add(data);
      var doc = await docRef.get();
      _list.add(Issue.fromJson(doc));
      notifyListeners();
    } on PlatformException {
      print("object");
    } catch (err) {
      print(err);
    }
  }

  void updateOne() {}

  // Future<StorageTaskSnapshot> uploadImage(Uint8List imageFile, int pos) {
  //   return storageRef
  //       .child("posts/${currentUser.uid}/$_postId/$pos.jpg")
  //       .putData(imageFile)
  //       .onComplete;
  // }
}
