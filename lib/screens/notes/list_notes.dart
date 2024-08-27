import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/date.dart';
import 'package:keep/screens/empty_state.dart';
import 'package:keep/utilities/switch_color.dart';
import 'package:keep/providers/notes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListNotes extends ConsumerStatefulWidget {
  const ListNotes({super.key});

  @override
  ConsumerState<ListNotes> createState() => _ListNotesState();
}

class _ListNotesState extends ConsumerState<ListNotes> {
  @override
  Widget build(BuildContext context) {
    var getNotes = ref.watch(noteNotifierProvider);
    var note = getNotes.toList();

    return getNotes.isEmpty
        ? const EmptyState()
        : ListView.separated(
            itemCount: getNotes.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                    color: SwitchColor.switchColor(note[index].color),
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  onTap: () => context.push('/notes/${note[index].id}'),
                  title: Text(
                    note[index].title,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                  subtitle: Text(
                    dateFormatter(note[index].timestamp),
                    style: const TextStyle(color: Colors.black87),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              height: 9,
              color: Colors.black87,
            ),
          );
  }
}
