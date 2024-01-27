import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/schema/action_schema.dart';
import 'package:my_app/screens/actions/edit_action_screen.dart';
import 'package:my_app/widgets/label.dart';

class ActionDetailScreen extends StatefulWidget {
  final ActionSchema action;
  const ActionDetailScreen({super.key, required this.action});

  @override
  State<ActionDetailScreen> createState() => _ActionDetailScreenState();
}

class _ActionDetailScreenState extends State<ActionDetailScreen> {
  TextEditingController _textController = TextEditingController();
  List _list = [];
  void _onSendUpdate() {
    setState(() {
      _list.add({"message": _textController.text, "datetime": DateTime.now()});
      _textController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text(
            "Close",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => EditActionScreen(
                      action: widget.action,
                    ))),
            child: Text(
              "Details",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.action.title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              color: Theme.of(context).backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(_list[index]['message']),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(_list[index]['datetime'].toString()),
                            ],
                          ),
                        );
                      }),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: _list.length)
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [Label(color: Colors.white, child: Text("Label"))],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.attach_file_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Form(
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _textController,
                                  decoration: const InputDecoration.collapsed(
                                    hintText: "Add an update...",
                                  ),
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.all(2),
                                onPressed: _onSendUpdate,
                                icon: Icon(
                                  Icons.send,
                                  color: Theme.of(context).primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
