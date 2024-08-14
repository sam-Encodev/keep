import 'package:flutter/material.dart';
import 'package:keep/utilities/styles.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  static const newNote = "Create your first note";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSVG("service_book.svg"),
          const SizedBox(height: 10),
          const Text(
            newNote,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
