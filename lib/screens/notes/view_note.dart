import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/components/go_back.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/providers/notes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewNote extends ConsumerWidget {
  const ViewNote({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final extraString = GoRouterState.of(context).pathParameters['noteId'];

    var note = ref
        .watch(noteNotifierProvider.notifier)
        .findNote(int.parse(extraString!));

    return Scaffold(
      appBar: AppBar(
        leading: GoBack(),
        title: Text(viewNote, style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
            style: iconButtonStyle(context),
            icon: const Icon(Icons.edit, size: standardIcon),
            onPressed: () => {context.push(RouteName.editNote(note.id))},
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(standardSpacing),
        width: double.maxFinite,
        height: double.maxFinite,
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(note.title, style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: minHeight),
            Text(note.description,
                style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
