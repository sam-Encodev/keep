import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/screens/notes/list_notes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

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
            style: iconButtonStyle(),
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () => context.go('/notes/search'),
          ),
          IconButton(
            style: iconButtonStyle(),
            icon: const Icon(Icons.info),
            color: Colors.white,
            onPressed: () => context.go(RouteNames.about),
          ),
          IconButton(
            style: iconButtonStyle(),
            icon: const Icon(Icons.account_circle_rounded),
            color: Colors.white,
            onPressed: () => context.go(RouteNames.profile(0)),
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
        onPressed: () => context.go('/notes/add'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black54,
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
