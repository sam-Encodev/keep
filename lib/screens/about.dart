import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/components/back_button.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: goBackButton(context),
        title: Text(about,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: standardFont)),
      ),
      body: Container(
          padding: const EdgeInsets.all(standardSpacing),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    buildText(font, context),
                    buildText(icons, context),
                    buildText(author, context),
                    buildText(designer, context),
                  ],
                ),
              ),
              buildText(version, context, height: 5.0),
            ],
          )),
    );
  }
}
