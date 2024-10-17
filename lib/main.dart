import 'package:flutter/material.dart';
import 'package:keep/widgets/app_start_up.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  runApp(
    ProviderScope(
        child: MaterialApp(
      home: const AppStartUp(),
      debugShowCheckedModeBanner: false,
    )),
  );
}
