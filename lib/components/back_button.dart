import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/styles.dart';

goBackButton(BuildContext context) {
  return IconButton(
      style: iconButtonStyle(),
      padding: EdgeInsets.zero,
      icon: const Icon(Icons.arrow_back, size: 30),
      color: Colors.white,
      onPressed: () => {context.pop()});
}
