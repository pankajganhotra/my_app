import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:my_app/schema/action_schema.dart';
import 'package:my_app/screens/actions/action_detail_screen.dart';
import 'package:my_app/widgets/label.dart';

class ActionCard extends StatelessWidget {
  final ActionSchema action;
  const ActionCard({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ActionDetailScreen(action: action)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                action.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Label(
                    color: Colors.grey[300],
                    child: Text(
                      action.category,
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  ),
                  Icon(Icons.label_outline),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("site")
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text("Reported By HJ"),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Updated ${Jiffy(action.updated).fromNow()}"),
                  Container(
                    color: Colors.yellow[50],
                    // decoration: BoxDecoration(borderRadius:),
                    padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        action.status,
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
