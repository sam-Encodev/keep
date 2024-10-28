import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';

switchIcon(context, message) {
  switch (message) {
    case "Note deleted":
    case "Update successful":
      return Icon(Icons.check_circle_outline_outlined,
          size: standardIcon,
          color: Colors.green);

    case addErrorEntry:
    case "Login failed":
    case "Email already exists":
    case "Update failed":
      return Icon(Icons.error_outline_outlined,
          size: standardIcon, color: Theme.of(context).colorScheme.error);
  }
}