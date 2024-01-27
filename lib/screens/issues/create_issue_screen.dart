import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  List<XFile?> _media = [];
  FirebaseStorage _storage = FirebaseStorage.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _siteController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void openGallery(String type) async {
    if (type == 'image') {
      final img = await _picker.pickMultiImage();
      setState(() {
        _media = img ?? [];
      });
    } else {
      final img = await _picker.pickVideo(source: ImageSource.gallery);
      setState(() {
        _media.add(img);
      });
    }
  }

  void onSubmit() async {
    try {
      print(_media);
      // for (var file in _media) {
      //   if (file != null) {
      //     Reference ref = FirebaseStorage.instance
      //         .ref()
      //         .child('flutter-tests')
      //         .child('/some-image.jpg');
      //     final metadata = SettableMetadata(
      //       contentType: 'image/jpeg',
      //       customMetadata: {'picked-file-path': file.path},
      //     );

      //     UploadTask uploadTask =
      //         ref.putData(File(file.path).readAsBytesSync(), metadata);
      //     debugPrint(uploadTask.toString());
      //   }
      // }
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _media.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: _media.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Image.file(
                                      File(_media[0]!.path),
                                      height: 100,
                                      width: 100,
                                    ));
                              },
                            )
                          : Text(_media.length.toString()),
                      Row(
                        children: [
                          const Icon(Icons.camera_alt_rounded),
                          const SizedBox(
                            width: 5,
                          ),
                          TextButton(
                            onPressed: () => openGallery("image"),
                            child: const Text(
                              "Add Photo",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(Icons.videocam_rounded),
                          const SizedBox(
                            width: 5,
                          ),
                          TextButton(
                            onPressed: () => openGallery("video"),
                            child: const Text(
                              "Add Video",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ],
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
