import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:keep/widgets/app_start_up.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('keep');

  runApp(
    const ProviderScope(
        child: MaterialApp(
      home: AppStartUp(),
      debugShowCheckedModeBanner: false,
    )),
  );
}
