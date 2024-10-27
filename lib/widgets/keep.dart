import 'package:flutter/material.dart';
import 'package:keep/constants/colors.dart';
import 'package:keep/providers/theme_provider.dart';
import 'package:keep/providers/router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Keep extends ConsumerWidget {
  const Keep({super.key});
  static const notes = "Notes";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final themer = ref.watch(themeStateProvider);

    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
      ),
      themeMode: themer.theme,
      title: notes,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
