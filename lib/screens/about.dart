import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/components/go_back.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GoBack(),
        title: Text(about, style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Container(
          padding: const EdgeInsets.all(standardSpacing),
          width: double.maxFinite,
          height: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              buildText(font, context),
              buildText(icons, context),
              buildText(author, context),
              buildText(designer, context),
            ],
          )),
    );
  }
}
