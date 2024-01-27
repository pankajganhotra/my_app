import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/providers/action_provider.dart';
import 'package:my_app/providers/issue_provider.dart';
import 'package:provider/provider.dart';

class CreateActionScreen extends StatefulWidget {
  static const String routeName = '/create_action';
  const CreateActionScreen({super.key});

  @override
  State<CreateActionScreen> createState() => _CreateActionScreenState();
}

class _CreateActionScreenState extends State<CreateActionScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _assigneeController = TextEditingController();
  final TextEditingController _siteController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

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
        await context.read<ActionProvider>().createOne({
          "title": _titleController.value.text,
          "description": _descController.value.text,
          "assignedTo": _assigneeController.text,
          "site": _siteController.value.text,
          "category": _categoryController.value.text,
          "status": "To Do",
          "dueDate": _dateController.text,
          "created": DateTime.now(),
          "updated": DateTime.now(),
        });
        print(_formKey.currentState!);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Action Created')),
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
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.3,
          foregroundColor: Colors.black,
          leading: TextButton(
            onPressed: Navigator.of(context).pop,
            child: Text(
              "Close",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          actions: [
            TextButton(
              onPressed: onSubmit,
              child: Text(
                "Create",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            )
          ],
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "*",
                      style: TextStyle(color: Colors.red, fontSize: 25),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _titleController,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                        decoration: InputDecoration.collapsed(
                          hintText: "What needs to be done",
                          hintStyle:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading: Icon(Icons.person_outline_rounded),
                      title: TextFormField(
                        controller: _descController,
                        decoration: InputDecoration.collapsed(
                          hintText: "Add description",
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
                    ListTile(
                      leading: Icon(Icons.person_outline_rounded),
                      title: TextFormField(
                        controller: _assigneeController,
                        decoration: InputDecoration.collapsed(
                          hintText: "Assignee",
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
                    ListTile(
                      leading: Icon(Icons.arrow_downward_sharp),
                      title: TextFormField(
                        controller: _categoryController,
                        decoration: InputDecoration.collapsed(
                          hintText: "Low",
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
                    ListTile(
                      leading: Icon(Icons.calendar_month_outlined),
                      title: TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration.collapsed(
                          hintText: "Due Date",
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
                    ListTile(
                      leading: Icon(Icons.label_outline),
                      title: TextFormField(
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
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
