import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app/providers/action_provider.dart';
import 'package:my_app/providers/issue_provider.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ActionProvider()),
      ChangeNotifierProvider(create: (_) => IssueProvider()),
    ],
    child: const MyApp(),
  ));
}
