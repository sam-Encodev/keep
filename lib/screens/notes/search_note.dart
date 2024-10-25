import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/screens/empty_state.dart';
import 'package:keep/components/back_button.dart';
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
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
          decoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.surfaceContainer,
              filled: true,
              hintText: placeholder,
              hintStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onSecondary),
              prefixIcon: goBackButton(context),
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.close,
                   size: standardIcon,
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
                  return SlidableActions(index: index, notes: notes);
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
