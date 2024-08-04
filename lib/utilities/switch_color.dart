import 'package:flutter/material.dart';

class SwitchColor {
  static Color switchColor(String color) {
    switch (color) {
      case 'red':
        return Colors.redAccent;
      case "orange":
        return Colors.orange;
      case "yellow":
        return Colors.yellow;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'indigo':
        return Colors.indigo;
      default:
        return Colors.white;
    }
  }
}
