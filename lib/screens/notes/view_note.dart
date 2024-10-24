import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/components/back_button.dart';
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: goBackButton(context),
        ),
        title: Text(viewNote,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 20)),
        actions: [
          IconButton(
            style: iconButtonStyle(context),
            icon: const Icon(Icons.edit),
            color: Colors.white,
            onPressed: () => {context.push(RouteNames.editNote(note.id))},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
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
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 30,
                      )),
                  Text(note.description,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 20)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
