import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/styles.dart';

goBackButton(BuildContext context) {
  return IconButton(
      icon: const Icon(Icons.arrow_back, size: standardIcon),
      onPressed: () => {context.pop()});
}
