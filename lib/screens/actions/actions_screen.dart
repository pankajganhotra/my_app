import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:my_app/providers/action_provider.dart';
import 'package:my_app/screens/actions/action_card.dart';
import 'package:my_app/screens/actions/create_action_screen.dart';
import 'package:provider/provider.dart';

import '../../schema/action_schema.dart';

class ActionsScreen extends StatefulWidget {
  static const String routeName = '/Actions';
  const ActionsScreen({super.key});

  @override
  State<ActionsScreen> createState() => _ActionsScreenState();
}

class _ActionsScreenState extends State<ActionsScreen> {
  void showSheet() {
    showModalBottomSheet(
      anchorPoint: Offset(200, 200),
      isScrollControlled: true,
      context: context,
      builder: (context) => CreateActionScreen(),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<ActionProvider>().fetchList();
  }

  Widget generateList(List<ActionSchema> list) {
    return Builder(builder: (context) {
      if (list.isEmpty) {
        return const Center(
          child: Text("No Actions"),
        );
      }
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ActionCard(action: list[index]);
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    var list = context.watch<ActionProvider>().list;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          "Actions",
          style: TextStyle(fontSize: 35),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.4,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Icon(Icons.sort_sharp, color: Colors.deepPurple),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Last Updated"),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(children: [
                  Expanded(child: generateList(list)),
                ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: showSheet,
      ),
    );
  }
}
