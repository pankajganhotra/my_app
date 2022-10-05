import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_app/providers/issue_provider.dart';
import 'package:provider/provider.dart';

class CreateIssueScreen extends StatefulWidget {
  final String category;
  static const String routeName = '/create_issue';
  const CreateIssueScreen({super.key, required this.category});

  @override
  State<CreateIssueScreen> createState() => _CreateIssueScreenState();
}

class _CreateIssueScreenState extends State<CreateIssueScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _siteController = TextEditingController();

  void onSubmit() async {
    try {
      // Validate returns true if the form is valid, or false otherwise.
      if (_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Submitting')),
        );
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.
        _formKey.currentState!.save();
        await context.read<IssueProvider>().createOne({
          "title": _titleController.value.text,
          "description": _descController.value.text,
          "site": _siteController.value.text,
          "category": widget.category,
          "status": "Open",
          "created": DateTime.now(),
          "updated": DateTime.now(),
        });
        print(_formKey.currentState!);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Issue Created')),
        );
        Navigator.pop(context);
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String convertedDateTime =
        "${now.day.toString().padLeft(2, '0')}-${now.month}-${now.year.toString()}";
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.cancel_sharp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.category),
        actions: [TextButton(child: Text("Submit"), onPressed: onSubmit)],
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 40, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.calendar_month_outlined),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    convertedDateTime,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _titleController,
                style: Theme.of(context).textTheme.headline6,
                decoration: InputDecoration.collapsed(
                  hintText: "Add Title",
                  hintStyle: Theme.of(context).textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.grey[500]),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration.collapsed(
                  hintText: "Description of what happened",
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Icon(Icons.label_outline),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _siteController,
                      decoration: InputDecoration.collapsed(
                        hintText: "Site",
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: const [
                      Icon(Icons.camera_alt_rounded),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Add Photo",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(Icons.videocam_rounded),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Add Video",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
