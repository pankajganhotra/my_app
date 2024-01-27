import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/schema/issue_schema.dart';
import 'package:my_app/screens/issues/edit_issue_screen.dart';
import 'package:my_app/widgets/label.dart';

class IssueDetailScreen extends StatefulWidget {
  static const String routeName = "/issue_details";
  final Issue issue;
  const IssueDetailScreen({super.key, required this.issue});

  @override
  State<IssueDetailScreen> createState() => _IssueDetailScreenState();
}

class _IssueDetailScreenState extends State<IssueDetailScreen> {
  @override
  Widget build(BuildContext context) {
    void _closeIssue() {
      Navigator.pop(context);
    }

    TextEditingController _textController = TextEditingController();
    List _list = [];
    void _onSendUpdate() {
      setState(() {
        _list
            .add({"message": _textController.text, "datetime": DateTime.now()});
        _textController.text = "";
      });
    }

    void _addDetails() {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => EditIssueScreen(issue: widget.issue)),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: TextButton(
          onPressed: _closeIssue,
          child: const Text(
            "Close",
            style: TextStyle(
              color: Colors.deepPurple,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: _addDetails,
            child: const Text(
              "Add details",
              style: TextStyle(
                color: Colors.deepPurple,
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Text(
              widget.issue.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            color: Theme.of(context).secondaryHeaderColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "You reported this issue",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.issue.created.toString()),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "You updated this issue",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.issue.updated.toString())
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "2 questions remaining",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(answerQuestionText),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Label(
                      color: Theme.of(context).secondaryHeaderColor,
                      child: Row(
                        children: [
                          Icon(Icons.chat),
                          Text("what needs to be done"),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Label(
                      color: Theme.of(context).secondaryHeaderColor,
                      child: Row(
                        children: [
                          Icon(Icons.chat),
                          Text("what caused it"),
                          Icon(Icons.chevron_right)
                        ],
                      ),
                    ),

                    // Container(
                    //   padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                    //   alignment: Alignment.bottomLeft,
                    //   child: Row(
                    //     children: [
                    //       Icon(
                    //         Icons.add,
                    //         color: Theme.of(context).primaryColor,
                    //       ),
                    //       const SizedBox(
                    //         width: 15,
                    //       ),
                    //       Expanded(
                    //         child: Container(
                    //           padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    //           decoration: BoxDecoration(
                    //               border: Border.all(color: Colors.grey),
                    //               borderRadius: BorderRadius.circular(10)),
                    //           child: Form(
                    //             child: Row(
                    //               children: [
                    //                 Expanded(
                    //                   child: TextFormField(
                    //                     decoration:
                    //                         const InputDecoration.collapsed(
                    //                       hintText: "Add an update...",
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 IconButton(
                    //                   padding: EdgeInsets.all(2),
                    //                   onPressed: () {},
                    //                   icon: Icon(
                    //                     Icons.send,
                    //                     color: Theme.of(context).primaryColor,
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
          )),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              color: Theme.of(context).secondaryHeaderColor,
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
            color: Colors.white,
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
