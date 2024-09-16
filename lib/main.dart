import 'package:flutter/material.dart';
import 'package:keep/widgets/app_start_up.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
        child: MaterialApp(
      home: AppStartUp(),
      debugShowCheckedModeBanner: false,
    )),
  );
}
