import 'package:flutter/material.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/components/switch_icon.dart';

snackBar(context, {message}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          switchIcon(context, message),
          SizedBox(width: spacing),
          Text(
            message,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          )
        ],
      )));
}
