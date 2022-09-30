import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/schema/issue_schema.dart';

class ListCardItem extends StatelessWidget {
  Issue issue;

  ListCardItem({super.key, required this.issue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      padding: const EdgeInsets.all(30),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Text(issue.title),
          Row(
            children: [
              Text(issue.title),
              const Icon(
                Icons.label_outline,
              ),
              Text(issue.description),
            ],
          ),
          Text('Reported By ${issue.title}')
        ],
      ),
    );
  }
}
