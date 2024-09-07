import 'package:flutter/material.dart';
import 'package:keep/routes/route_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const notes = "Notes";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: notes,
      routerConfig: router(),
      debugShowCheckedModeBanner: false,
    );
  }
}
