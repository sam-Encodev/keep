import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/date.dart';
import 'package:keep/constants/widgets.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/screens/empty_state.dart';
import 'package:keep/utilities/switch_color.dart';
import 'package:keep/providers/notes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListNotes extends ConsumerWidget {
  ListNotes({super.key});

  late final controller = SlidableController(this as TickerProvider);

  static const spacing = 8.0;
  static const padding = 10.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var getNotes = ref.watch(noteNotifierProvider);
    var note = getNotes.toList();

    return getNotes.isEmpty
        ? const EmptyState()
        : ListView.separated(
            itemCount: getNotes.length.toInt(),
            itemBuilder: (BuildContext context, int index) {
              return Slidable(
                key: ValueKey(index),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    const SizedBox(width: spacing),
                    SlidableAction(
                      label: 'Edit',
                      icon: Icons.edit,
                      backgroundColor: Colors.black87,
                      foregroundColor: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      padding: const EdgeInsets.symmetric(horizontal: padding),
                      onPressed: (_) => {
                        context.push(
                          RouteNames.notesEditNoteId(note[index].id),
                        )
                      },
                    ),
                    const SizedBox(width: spacing),
                    SlidableAction(
                      icon: Icons.delete,
                      label: 'Delete',
                      backgroundColor: Colors.black87,
                      foregroundColor: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      padding: const EdgeInsets.symmetric(horizontal: padding),
                      onPressed: (_) => {
                        ref
                            .read(noteNotifierProvider.notifier)
                            .removeNote(note[index].id),
                        snackBar(context, note[index].title, "deleted")
                      },
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: SwitchColor.switchColor(note[index].color),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: () =>
                        context.push(RouteNames.notesNoteId(note[index].id)),
                    title: Text(
                      note[index].title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                    subtitle: Text(
                      dateFormatter(note[index].timestamp),
                      style: const TextStyle(color: Colors.black87),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              height: spacing,
              color: Colors.black87,
            ),
          );
  }
}
