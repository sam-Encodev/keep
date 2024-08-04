import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/data.dart';
import 'package:keep/screens/empty_state.dart';
import 'package:keep/screens/notes/list_notes.dart';

class Home extends StatelessWidget {
  Home({super.key});

  static const appName = "Notes";

  final notes = NotesData().getNotes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        title: const Text(appName,
            style: TextStyle(color: Colors.white, fontSize: 20)),
        actions: [
          IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black87),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () => context.push("/search"),
          ),
          IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black87),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
            icon: const Icon(Icons.info),
            color: Colors.white,
            onPressed: () => context.push("/about"),
            // ignore: avoid_print
            // onPressed: () => print(notes[1]),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: notes.isEmpty ? const EmptyState() : ListNotes(data: notes)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/notes/new'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black54,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
