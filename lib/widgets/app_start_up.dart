import 'package:flutter/material.dart';
import 'package:keep/widgets/keep.dart';
import 'package:keep/providers/app_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStartUp extends ConsumerWidget {
  const AppStartUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);
    return const Keep();
  }
}
