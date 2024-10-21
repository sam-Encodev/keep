import 'package:flutter/material.dart';

switchIcon(message) {
  if (message.toString().contains("deleted")) {
    return Icon(Icons.check_circle_outline_outlined, color: Colors.green);
  }
  return Icon(Icons.error_outline_outlined, color: Colors.red);
}
