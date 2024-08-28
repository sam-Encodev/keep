import 'package:flutter/material.dart';
import 'package:keep/utilities/styles.dart';

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
      Text(
        body,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      )
    ],
  );
}