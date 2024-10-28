import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';

class EmptyState extends StatelessWidget {
  final String uri;
  final bool hideText;

  const EmptyState({super.key, required this.uri, this.hideText = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSVG(uri),
          const SizedBox(height: standardSpacing),
          if (!hideText)
            Text(
              createNote,
              style: TextStyle(fontSize: standardFont),
            )
        ],
      ),
    );
  }
}
