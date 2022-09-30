import 'package:flutter/material.dart';

class InspectionScreen extends StatefulWidget {
  const InspectionScreen({super.key});

  @override
  State<InspectionScreen> createState() => _InspectionScreenState();
}

class _InspectionScreenState extends State<InspectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Inspection",
          style: TextStyle(fontSize: 35),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        foregroundColor: Colors.black,
      ),
      body: Center(child: Text("Inspection")),
    );
  }
}
