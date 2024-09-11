import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/date.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/constants/widgets.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/screens/empty_state.dart';
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
        backgroundColor: Colors.black87,
        title: TextField(
          controller: textController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              fillColor: Colors.black12,
              filled: true,
              hintText: placeholder,
              hintStyle: const TextStyle(color: Colors.white),
              prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () => context.pop()),
              suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () => {
                        setState(() {
                          textController.text = "";
                        }),
                        ref.read(searchNotifierProvider.notifier).search("")
                      }),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(color: Colors.black12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(color: Colors.black54),
              )),
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
        decoration: const BoxDecoration(
          color: Colors.black87,
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
                          backgroundColor: Colors.black87,
                          foregroundColor: Colors.white,
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
                          backgroundColor: Colors.black87,
                          foregroundColor: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          padding:
                              const EdgeInsets.symmetric(horizontal: padding),
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
              ),
      ),
    );
  }
}
