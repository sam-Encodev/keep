import 'package:flutter/material.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/utilities/switch_color.dart';

colorClip(value) {
  return ClipOval(
      child: Container(
          height: 30, width: 30, color: SwitchColor.switchColor(value)));
}

onBoard(item) {
  String image = item["image"];
  String title = item["title"];
  String body = item["body"];

  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      buildSVG(image),
      const SizedBox(height: 50),
      Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
      ),
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          body,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
      )
    ],
  );
}

snackBar(context, item, text) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text('$item $text')));
}
