import 'package:flutter/material.dart';
import 'package:my_app/screens/issues/create_issue_screen.dart';

class IssueCategorySheet extends StatelessWidget {
  IssueCategorySheet({super.key});

  final List<String> list = [
    "Observation",
    "Maintainence",
    "Incident",
    "Near Miss",
    "Hazard"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              "What type of issue ?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, index) => ListTile(
              title: Text(list[index]),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateIssueScreen(category: list[index]),
                  ),
                );
                // Navigator.pushNamed(context, CreateIssueScreen.routeName,
                //     arguments: {"category": list[index]});
              },
            ),
          ),
          const Divider(),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Customize Categories",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
