import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/components/back_button.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        leading: goBackButton(context),
        title: Text(about, style: TextStyle(fontSize: standardFont)),
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
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  buildText(font, context),
                  buildText(icons, context),
                  buildText(author, context),
                  buildText(designer, context),
                ],
              ),
              buildText(version, context, height: spacing),
            ],
          )),
    );
  }
}
