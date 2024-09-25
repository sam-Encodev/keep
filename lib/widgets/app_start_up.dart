import 'package:flutter/material.dart';
import 'package:keep/widgets/keep.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStartUp extends ConsumerWidget {
  const AppStartUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Keep();
  }
}
