import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/date.dart';
import 'package:keep/utilities/styles.dart';
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var getNotes = ref.watch(noteNotifierProvider);
    var notes = getNotes.toList();

    return getNotes.isEmpty
        ? const EmptyState(uri: "service_book.svg")
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
                          RouteNames.editNote(notes[index].id),
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
                            .removeNote(notes[index].id),
                        snackBar(context, notes[index].title, "deleted")
                      },
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: SwitchColor.switchColor(notes[index].color),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: () =>
                        context.push(RouteNames.viewNote(notes[index].id)),
                    title: Text(
                      notes[index].title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                    subtitle: Text(
                      dateFormatter(notes[index].timestamp),
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 13),
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
