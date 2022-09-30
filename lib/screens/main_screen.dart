import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Main",
          style: TextStyle(fontSize: 35),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        foregroundColor: Colors.black,
      ),
      body: Center(child: Text("Main")),
    );
  }
}
