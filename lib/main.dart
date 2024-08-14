import 'package:flutter/material.dart';
import 'package:keep/routes/route_navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const notes = "Notes";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: notes,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
