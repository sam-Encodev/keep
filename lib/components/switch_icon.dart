import 'package:flutter/material.dart';
import 'package:keep/utilities/styles.dart';

switchIcon(message) {
  if (message.toString().contains("deleted")) {
    return Icon(Icons.check_circle_outline_outlined,
        size: standardIcon, color: Colors.green);
  }
  return Icon(Icons.error_outline_outlined,
      size: standardIcon, color: Colors.red);
}
