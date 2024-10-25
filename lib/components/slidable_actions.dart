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
  final dynamic index;
  final dynamic notes;

  const SlidableActions({super.key, this.index, this.notes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      key: ValueKey(index),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          const SizedBox(width: spacing),
          SlidableAction(
            label: 'Edit',
            icon: Icons.edit,
            backgroundColor: Theme.of(context).colorScheme.surface,
            foregroundColor: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(iconButtonRadius),
            padding: const EdgeInsets.symmetric(horizontal: standardSpacing),
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
            backgroundColor: Theme.of(context).colorScheme.surface,
            foregroundColor: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(iconButtonRadius),
            padding: const EdgeInsets.symmetric(horizontal: standardSpacing),
            onPressed: (_) => {
              ref
                  .read(noteNotifierProvider.notifier)
                  .removeNote(notes[index].id),
              snackBar(context, message: "${notes[index].title} deleted")
            },
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
            color: SwitchColor.switchColor(notes[index].color),
            borderRadius: BorderRadius.circular(iconButtonRadius)),
        child: ListTile(
          onTap: () => context.push(RouteNames.viewNote(notes[index].id)),
          title: Text(
            notes[index].title,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: standardFont),
          ),
          subtitle: Text(
            dateFormatter(notes[index].timestamp),
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}