import 'package:flutter/material.dart';

class ActionsScreen extends StatefulWidget {
  const ActionsScreen({super.key});

  @override
  State<ActionsScreen> createState() => _ActionsScreenState();
}

class _ActionsScreenState extends State<ActionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Actions",
          style: TextStyle(fontSize: 35),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        foregroundColor: Colors.black,
      ),
      body: Center(child: Text("Actins")),
    );
  }
}
