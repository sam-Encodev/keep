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
      SizedBox(height: maxHeight),
      Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize:  Theme.of(context).textTheme.titleLarge?.fontSize, fontWeight: FontWeight.w800),
      ),
      SizedBox(height: minHeight),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: minHeight),
        child: Text(
          body,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      )
    ],
  );
}