import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/screens/notes/list_notes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  static const userId = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onPressed: () => context.push(RouteNames.search),
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
            onPressed: () => context.push(RouteNames.about),
          ),
          IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black87),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
            icon: const Icon(Icons.account_circle_rounded),
            color: Colors.white,
            onPressed: () => context.push(RouteNames.profile(0)),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: ListNotes()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(RouteNames.notesNew),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black54,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
