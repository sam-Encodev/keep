import 'package:flutter/material.dart';
import 'package:keep/widgets/keep.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class AppStartUp extends ConsumerStatefulWidget {
  const AppStartUp({super.key});

  @override
  ConsumerState<AppStartUp> createState() => _AppStartUpState();
}

class _AppStartUpState extends ConsumerState<AppStartUp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Keep();
  }
}
