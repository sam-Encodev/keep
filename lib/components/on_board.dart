import 'package:flutter/material.dart';
import 'package:keep/utilities/styles.dart';

onBoard(context, item) {
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
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 20,
            fontWeight: FontWeight.w800),
      ),
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          body,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: 17),
        ),
      )
    ],
  );
}
