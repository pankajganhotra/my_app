import 'package:flutter/material.dart';
import 'package:my_app/schema/action_schema.dart';

class EditActionScreen extends StatefulWidget {
  static const String routeName = "action_details_edit";
  final ActionSchema action;
  const EditActionScreen({super.key, required this.action});

  @override
  State<EditActionScreen> createState() => _EditActionScreenState();
}

class _EditActionScreenState extends State<EditActionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: Navigator.of(context).pop,
            icon: Icon(
              Icons.chevron_left,
              color: Theme.of(context).primaryColor,
              size: 30,
            )),
        centerTitle: true,
        title: Text(
          "Add details",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.action.title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Icon(
                        Icons.edit,
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.action.description),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Status = Open"),
                  ElevatedButton(onPressed: () => null, child: Text("Resolve")),
                ],
              ),
            ),
            const Divider(height: 1),
            ListView(
              shrinkWrap: true,
              children: const [
                ListTile(
                  leading: Icon(Icons.folder_outlined),
                  title: Text("text"),
                ),
                ListTile(
                  leading: Icon(Icons.label_outline_sharp),
                  title: Text("text"),
                ),
                ListTile(
                  leading: Icon(Icons.person_outline_rounded),
                  title: Text("text"),
                ),
                ListTile(
                  leading: Icon(Icons.label_important_outline_sharp),
                  title: Text("text"),
                ),
                ListTile(
                  leading: Icon(Icons.calendar_month_outlined),
                  title: Text("text"),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text("Reported by HJ ${widget.action.created}"),
            ),
            TextButton(
                onPressed: () => null,
                child: Row(
                  children: [
                    Icon(Icons.message),
                    SizedBox(
                      width: 15,
                    ),
                    Text("View Report")
                  ],
                )),
            TextButton(
                onPressed: () => null,
                child: Row(
                  children: [
                    Icon(Icons.message),
                    SizedBox(
                      width: 15,
                    ),
                    Text("View Report")
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
