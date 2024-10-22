import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/styles.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black87,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              style: iconButtonStyle(),
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.arrow_back, size: 30),
              color: Colors.white,
              onPressed: () => context.pop(),
            ),
          )),
      body: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    buildText(font),
                    buildText(icons),
                    buildText(author),
                    buildText(designer),
                  ],
                ),
              ),
              buildText(version, height: 5.0),
            ],
          )),
    );
  }
}
