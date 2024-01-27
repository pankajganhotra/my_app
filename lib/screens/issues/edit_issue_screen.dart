import 'package:flutter/material.dart';
import 'package:my_app/schema/issue_schema.dart';
import 'package:my_app/widgets/label.dart';

class EditIssueScreen extends StatefulWidget {
  static const String routeName = "issue_details_edit";
  final Issue issue;
  const EditIssueScreen({super.key, required this.issue});

  @override
  State<EditIssueScreen> createState() => _EditIssueScreenState();
}

class _EditIssueScreenState extends State<EditIssueScreen> {
  bool _editingEnabled = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _siteController = TextEditingController();
  final TextEditingController _assigneeController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.issue.title;
    _descController.text = widget.issue.description;
  }

  void toggleEditMode() {
    setState(() {
      _editingEnabled = !_editingEnabled;
    });
  }

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
      body: SingleChildScrollView(
        child: Form(
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
                        Expanded(
                          child: TextFormField(
                            enabled: _editingEnabled,
                            decoration:
                                InputDecoration.collapsed(hintText: "Title"),
                            controller: _titleController,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        IconButton(
                          onPressed: toggleEditMode,
                          icon: Icon(
                            Icons.edit,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: TextFormField(
                        enabled: _editingEnabled,
                        decoration:
                            InputDecoration.collapsed(hintText: "description"),
                        controller: _descController,
                      ),
                    ),
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
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Theme.of(context).primaryColor)),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: DropdownButtonFormField(
                          decoration:
                              InputDecoration.collapsed(hintText: "Status"),
                          onChanged: (v) {},
                          items: [
                            DropdownMenuItem(
                                value: "Open",
                                child: Text(
                                  "Open",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Label(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Resolve",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
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
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    leading: Icon(Icons.label_outline_sharp),
                    title: Text("text"),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    leading: Icon(Icons.person_outline_rounded),
                    title: Text("text"),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    leading: Icon(Icons.label_important_outline_sharp),
                    title: Text("text"),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_month_outlined),
                    title: Text("text"),
                  ),
                  const Divider(
                    height: 0,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reported by HJ ${widget.issue.created}"),
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
                            Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Delete Issue",
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
