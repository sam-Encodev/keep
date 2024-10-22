import 'package:flutter/material.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/components/switch_icon.dart';

snackBar(context, {message}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: spacing),
        child: switchIcon(message),
      ),
      Text(
        message,
        style: TextStyle(color: Colors.white),
      )
    ],
  )));
}