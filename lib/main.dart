import 'package:flutter/material.dart';
import 'package:keep/widgets/app_start_up.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    ProviderScope(
        child: MaterialApp(
      home: const AppStartUp(),
      debugShowCheckedModeBanner: false,
    )),
  );
}
