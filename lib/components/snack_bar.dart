import 'package:flutter/material.dart';

snackBar(context, {message}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          )
        ],
      )));
}
