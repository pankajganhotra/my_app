import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:my_app/schema/issue_schema.dart';

class IssueProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final List<Issue> _list = [];

  List<Issue> get list => _list;

  void fetchList() {

  }

  void fetchOne() {}

  void createOne() {}

  void updateOne() {}
}
