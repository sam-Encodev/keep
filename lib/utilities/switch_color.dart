import 'package:flutter/material.dart';

const colors = [
  {
    "name": 'red',
  },
  {
    "name": 'blue',
  },
  {
    "name": 'pink',
  },
  {
    "name": 'lime',
  },
  {
    "name": 'grey',
  },
  {
    "name": 'green',
  },
  {
    "name": 'indigo',
  },
  {
    "name": 'yellow',
  },
  {
    "name": 'orange',
  },
];

class SwitchColor {
  static Color color([color = ""]) {
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
      case 'grey':
        return Colors.grey;
      case 'pink':
        return Colors.pink;
      default:
        return Colors.lime;
    }
  }
}
