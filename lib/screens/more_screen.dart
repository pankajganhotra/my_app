import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "More",
          style: TextStyle(fontSize: 35),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        foregroundColor: Colors.black,
      ),
      body: Center(child: Text("More")),
    );
  }
}
