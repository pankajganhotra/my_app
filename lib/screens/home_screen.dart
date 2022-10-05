import 'package:flutter/material.dart';
import 'package:my_app/screens/actions/actions_screen.dart';
import 'package:my_app/screens/inspection_screen.dart';
import 'package:my_app/screens/issues/issues_screen.dart';
import 'package:my_app/screens/main_screen.dart';
import 'package:my_app/screens/more_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  void onItemTap(int index) {
    setState(() {
      _index = index;
    });
  }

  final List<BottomNavigationBarItem> _navItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.email,
      ),
      label: "Inspections",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.email,
      ),
      label: "Issues",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.label_outline,
      ),
      label: "Actions",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person_outline,
      ),
      label: "More",
    )
  ];

static const  List<Widget> _widgets = <Widget>[
  MainScreen(),
  InspectionScreen(),
  IssuesScreen(),
  ActionsScreen(),
  MoreScreen(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: onItemTap,
        selectedItemColor: Colors.deepPurple[700],
        unselectedItemColor: Colors.grey[900],
        backgroundColor: Colors.grey[200],
        items: _navItems,
      ),
    );
  }
}
