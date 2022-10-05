import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:my_app/providers/action_provider.dart';
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
    // showModalBottomSheet(
    // context: context, builder: (context) => ActionCategorySheet());
  }

  // @override
  // void initState() {
  //   context.read<ActionProvider>().fetchList();
  // }

  Widget generateList(List<ActionSchema> list) {
    return Builder(builder: (context) {
      if (list.length < 1) {
        return Center(
          child: Text("No Actions"),
        );
      }
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.grey[300],
                          // decoration: BoxDecoration(borderRadius:),
                          padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                          child: Text(
                            list[index].category,
                            style: TextStyle(color: Colors.grey[800]),
                          ),
                        ),
                        Icon(Icons.label_outline),
                        const SizedBox(
                          width: 5,
                        ),
                        Text("site")
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Reported By HJ"),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Updated ${Jiffy(list[index].updated).fromNow()}"),
                        Container(
                          color: Colors.yellow[50],
                          // decoration: BoxDecoration(borderRadius:),
                          padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              list[index].status,
                              style: TextStyle(color: Colors.grey[800]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
    });
    // }
    // return const Center(child: Text("No Actions Created"));
  }

  @override
  Widget build(BuildContext context) {
    // var list = context.watch<ActionProvider>().list;
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
                  Expanded(child: generateList([])),
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
