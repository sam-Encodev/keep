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
      SizedBox(height: 50),
      Text(
        title,
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: standardFont,
            fontWeight: FontWeight.w800),
      ),
      SizedBox(height: 15),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          body,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary, fontSize: minFont, ),
        ),
      )
    ],
  );
}
