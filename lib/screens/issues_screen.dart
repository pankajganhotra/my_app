import 'package:flutter/material.dart';

class IssuesScreen extends StatefulWidget {
  const IssuesScreen({super.key});

  @override
  State<IssuesScreen> createState() => _IssuesScreenState();
}

class _IssuesScreenState extends State<IssuesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Issues",
          style: TextStyle(fontSize: 35),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        foregroundColor: Colors.black,
      ),
      body: Center(child: Text("Issues")),
    );
  }
}
