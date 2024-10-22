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
          const SizedBox(height: 10),
          if (!hideText)
            const Text(
              createNote,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
        ],
      ),
    );
  }
}
