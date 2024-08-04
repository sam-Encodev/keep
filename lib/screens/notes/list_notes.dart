import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/switch_color.dart';

class ListNotes extends StatelessWidget {
  const ListNotes({super.key, required this.data});

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    final notes = data;
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final note = notes[index];
        return Container(
          decoration: BoxDecoration(
              color: SwitchColor.switchColor(note['color']!),
              borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            onTap: () => context.push('/notes/${note['id']}'),
            title: Text(
              note['title']!,
              style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 23),
            ),
            subtitle: Text(
              '${note['timestamp']}',
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        );
      },
      itemCount: notes.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 9,
        color: Colors.black87,
      ),
    );
  }
}
