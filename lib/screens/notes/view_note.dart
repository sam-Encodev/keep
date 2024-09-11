import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/providers/notes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewNote extends ConsumerWidget {
  const ViewNote({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final extraString = GoRouterState.of(context).pathParameters['noteId'];
    var getNotes = ref.watch(noteNotifierProvider);
    var transformNotes = getNotes.toList();
    var note = transformNotes[int.parse(extraString!)];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black87),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.arrow_back, size: 30),
            color: Colors.white,
            onPressed: () => context.pop(),
          ),
        ),
        actions: [
          IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black87),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                )),
            icon: const Icon(Icons.edit),
            color: Colors.white,
            onPressed: () =>
                {context.push(RouteNames.editNote(note.id))},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black87,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  const SizedBox(height: 30),
                  Text(note.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      )),
                  Text(note.description,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
