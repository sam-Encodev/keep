import 'package:flutter/material.dart';
import 'package:keep/utilities/date.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/components/snack_bar.dart';
import 'package:keep/utilities/switch_color.dart';
import 'package:keep/providers/notes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableActions extends ConsumerWidget {
  final int index;
  final dynamic note;

  const SlidableActions({super.key, this.note, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      key: ValueKey(note.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          const SizedBox(width: spacing),
          SlidableAction(
            label: 'Edit',
            icon: Icons.edit,
            foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            backgroundColor: Colors.transparent,
            borderRadius: BorderRadius.circular(iconButtonRadius),
            padding: const EdgeInsets.symmetric(horizontal: standardSpacing),
            onPressed: (_) => {
              context.push(
                RouteName.editNote(note.id),
              )
            },
          ),
          const SizedBox(width: spacing),
          SlidableAction(
            icon: Icons.delete,
            label: 'Delete',
            foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            backgroundColor: Colors.transparent,
            borderRadius: BorderRadius.circular(iconButtonRadius),
            padding: const EdgeInsets.symmetric(horizontal: standardSpacing),
            onPressed: (_) => {
              ref
                  .read(noteNotifierProvider.notifier)
                  .removeNote(note.id, index),
              snackBar(
                context,
                message: "Note deleted",
                withAction: true,
                ref: ref,
              )
            },
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
            color: SwitchColor.color(note.color),
            borderRadius: BorderRadius.circular(iconButtonRadius)),
        child: ListTile(
          onTap: () => context.push(RouteName.viewNote(note.id)),
          title: Text(
            note.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: titleMedium,
                color: Theme.of(context).colorScheme.shadow),
          ),
          subtitle: Text(
            dateFormatter(note.timestamp),
            style: TextStyle(
                fontSize: labelSmall,
                color: Theme.of(context).colorScheme.shadow),
          ),
        ),
      ),
    );
  }
}
