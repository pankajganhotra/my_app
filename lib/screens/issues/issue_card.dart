import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:my_app/schema/issue_schema.dart';
import 'package:my_app/screens/issues/issue_detail_screen.dart';
import 'package:my_app/widgets/label.dart';

class IssueCard extends StatelessWidget {
  final Issue issue;
  const IssueCard({super.key, required this.issue});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => IssueDetailScreen(issue: issue),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                issue.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Label(
                    color: Colors.grey[300],
                    child: Text(
                      issue.category,
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(Icons.label_outline),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text("site")
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Reported By HJ"),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Updated ${Jiffy(issue.updated).fromNow()}"),
                  Label(
                    color: Colors.yellow[50],
                    // decoration: BoxDecoration(borderRadius:),
                    // padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        issue.status,
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
