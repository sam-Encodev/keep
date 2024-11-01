import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/styles.dart';

class GoBack extends StatelessWidget {
  const GoBack({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back, size: standardIcon),
        onPressed: () => {context.pop()});
  }
}
