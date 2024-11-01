import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/components/go_back.dart';
import 'package:keep/components/empty_state.dart';
import 'package:keep/providers/search_provider.dart';
import 'package:keep/components/slidable_actions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          controller: textController,
          decoration: InputDecoration(
              fillColor: inputFillColor(context),
              filled: true,
              hintText: placeholder,
              hintStyle: hintStyle(context),
              prefixIcon: GoBack(),
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: standardIcon,
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
        padding: const EdgeInsets.all(standardSpacing),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        ),
        child: getNotes.isEmpty
            ? const EmptyState(uri: "search.svg", hideText: true)
            : ListView.separated(
                itemCount: getNotes.length.toInt(),
                itemBuilder: (BuildContext context, int index) {
                  return SlidableActions(note: notes[index]);
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
