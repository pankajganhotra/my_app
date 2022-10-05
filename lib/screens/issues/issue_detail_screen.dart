import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/schema/issue_schema.dart';
import 'package:my_app/screens/issues/edit_issue_screen.dart';

class IssueDetailScreen extends StatelessWidget {
  static const String routeName = "/issue_details";
  final Issue issue;
  const IssueDetailScreen({super.key, required this.issue});

  @override
  Widget build(BuildContext context) {
    void _closeIssue() {
      Navigator.pop(context);
    }

    void _addDetails() {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => EditIssueScreen(issue: issue)),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: TextButton(
          onPressed: _closeIssue,
          child: const Text(
            "Close",
            style: TextStyle(
              color: Colors.deepPurple,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: _addDetails,
            child: const Text(
              "Add details",
              style: TextStyle(
                color: Colors.deepPurple,
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Text(
              issue.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 30,
            padding: const EdgeInsets.all(12),
            color: Theme.of(context).secondaryHeaderColor,
            child: Text(issue.title),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "2 questions remaining",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(answerQuestionText),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 30,
                  padding: const EdgeInsets.all(12),
                  color: Theme.of(context).secondaryHeaderColor,
                  child: Text(issue.title),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
