import 'package:flutter/material.dart';
import 'package:keep/widgets/app_start_up.dart';
import 'package:keep/providers/lean_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseProvider extends StatelessWidget {
  final dynamic sharedPreferences;

  const BaseProvider({super.key, required this.sharedPreferences});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences)
      ],
      child: AppStartUp(),
    );
  }
}
