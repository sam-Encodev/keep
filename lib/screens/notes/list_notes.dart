import 'package:flutter/material.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/components/empty_state.dart';
import 'package:keep/providers/notes_provider.dart';
import 'package:keep/components/slidable_actions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListNotes extends ConsumerWidget {
  ListNotes({super.key});

  late final controller = SlidableController(this as TickerProvider);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var getNotes = ref.watch(noteNotifierProvider);
    var notes = getNotes.toList();

    return getNotes.isEmpty
        ? const EmptyState(uri: "service_book.svg")
        : ListView.separated(
            itemCount: notes.length.toInt(),
            itemBuilder: (BuildContext context, int index) {
              return SlidableActions(note: notes[index], index: index);
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: spacing,
                color: Theme.of(context).colorScheme.onPrimary,
            ),
          );
  }
}
