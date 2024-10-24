import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/date.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/screens/empty_state.dart';
import 'package:keep/components/snack_bar.dart';
import 'package:keep/utilities/switch_color.dart';
import 'package:keep/providers/notes_provider.dart';
import 'package:keep/providers/search_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SearchNote extends ConsumerStatefulWidget {
  const SearchNote({super.key});

  @override
  ConsumerState<SearchNote> createState() => _SearchNote();
}

class _SearchNote extends ConsumerState<SearchNote> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var getNotes = ref.watch(searchNotifierProvider);
    var notes = getNotes.toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: TextField(
          controller: textController,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
          decoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.surfaceContainer,
              filled: true,
              hintText: placeholder,
              hintStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary),
              prefixIcon: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () => context.pop()),
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 30,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () => {
                        setState(() {
                          textController.text = "";
                        }),
                        ref.read(searchNotifierProvider.notifier).search("")
                      }),
              enabledBorder: inputBorder(context),
              focusedBorder: focusBorder(context)),
          onEditingComplete: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onChanged: (text) {
            ref.read(searchNotifierProvider.notifier).search(text);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        ),
        child: getNotes.isEmpty
            ? const EmptyState(uri: "search.svg", hideText: true)
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
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          foregroundColor:
                              Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                          padding:
                              const EdgeInsets.symmetric(horizontal: padding),
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
                          backgroundColor:
                              Theme.of(context).colorScheme.surface,
                          foregroundColor:
                              Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                          padding:
                              const EdgeInsets.symmetric(horizontal: padding),
                          onPressed: (_) => {
                            ref
                                .read(noteNotifierProvider.notifier)
                                .removeNote(notes[index].id),
                            snackBar(context,
                                message: "${notes[index].title} deleted")
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
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                        subtitle: Text(
                          dateFormatter(notes[index].timestamp),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => Divider(
                  height: spacing,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
      ),
    );
  }
}
