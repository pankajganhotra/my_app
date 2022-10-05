import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShareIssueSheet extends StatelessWidget {
  const ShareIssueSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: Column(
        children: [
          Text("Who should be notified about this issue?"),
          SizedBox(
            height: 15,
          ),
          Text("Users you add will be notified about this issue."),
          SizedBox(
            height: 15,
          ),
          Row(
            children: const [
              CircleAvatar(
                child: Icon(Icons.add),
              ),
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              CircleAvatar(
                child: Icon(Icons.person),
              ),
            ],
          )
        ],
      ),
    );
  }
}
