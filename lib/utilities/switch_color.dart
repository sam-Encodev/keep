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
    "name": 'green',
  },
  {
    "name": 'grey',
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
  static Color switchColor([color = ""]) {
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
