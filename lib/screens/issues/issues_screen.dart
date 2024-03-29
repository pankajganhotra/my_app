import 'package:flutter/material.dart';
import 'package:my_app/providers/issue_provider.dart';
import 'package:my_app/screens/issues/issue_card.dart';
import 'package:my_app/widgets/label.dart';
import 'package:my_app/widgets/sheets/issue_category_sheet.dart';
import 'package:provider/provider.dart';

import '../../schema/issue_schema.dart';

class IssuesScreen extends StatefulWidget {
  static const String routeName = '/issues';
  const IssuesScreen({super.key});

  @override
  State<IssuesScreen> createState() => _IssuesScreenState();
}

class _IssuesScreenState extends State<IssuesScreen> {
  void showSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => IssueCategorySheet());
  }

  @override
  void initState() {
    context.read<IssueProvider>().fetchList();
  }

  Widget generateList(List<Issue> list) {
    return Builder(builder: (context) {
      if (list.length < 1) {
        return Center(
          child: Text("No Issues"),
        );
      }
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return IssueCard(issue: list[index]);
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    var list = context.watch<IssueProvider>().list;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text(
          "Issues",
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
                children: [
                  const Icon(Icons.sort_sharp, color: Colors.deepPurple),
                  const SizedBox(
                    width: 10,
                  ),
                  Label(
                    color: Theme.of(context).secondaryHeaderColor,
                    child: Row(
                      children: const [
                        Text("Last Updated"),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.arrow_downward_sharp,
                          size: 16,
                        )
                      ],
                    ),
                  ),
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
