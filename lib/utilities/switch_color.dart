import 'package:flutter/material.dart';

const colors = [
  {
    "name": 'red',
  },
  {
    "name": 'orange',
  },
  {
    "name": 'yellow',
  },
  {
    "name": 'green',
  },
  {
    "name": 'blue',
  },
  {
    "name": 'indigo',
  },
  {
    "name": 'white',
  }
];

class SwitchColor {
  static Color switchColor([String color = ""]) {
    switch (color) {
      case "red":
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
      case 'white':
        return Colors.white;
      default:
        return Colors.lightGreenAccent;
    }
  }
}
