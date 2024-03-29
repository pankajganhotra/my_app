import 'package:flutter/material.dart';
import 'package:my_app/screens/issues/create_issue_screen.dart';
import 'package:my_app/screens/home_screen.dart';
class ScreenArguments {
  final String category;

  ScreenArguments({required this.category});
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
          primarySwatch: Colors.blue,
          secondaryHeaderColor: Colors.deepPurple[50],
          primaryColor: Colors.deepPurple[700],
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          backgroundColor: Colors.blue[50],
          textTheme: TextTheme()
      ),
      // home: const HomeScreen(),
      initialRoute: "/",
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        CreateIssueScreen.routeName: (context) {
          return const CreateIssueScreen(category: "category");
        },
      },
    );
  }
}
