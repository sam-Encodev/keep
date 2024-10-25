import 'package:flutter/material.dart';
import 'package:keep/models/note.dart';
import 'package:keep/constants/text.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/components/color_clip.dart';
import 'package:keep/components/back_button.dart';
import 'package:keep/utilities/switch_color.dart';
import 'package:keep/providers/notes_provider.dart';
import 'package:keep/providers/router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditNote extends ConsumerStatefulWidget {
  const EditNote({super.key});

  @override
  ConsumerState<EditNote> createState() => EditNoteForm();
}

class EditNoteForm extends ConsumerState<EditNote> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _color;
  String? _titleField;
  String? _descriptionField;
  final String _timestamp = DateTime.timestamp().toString();

  String? _oldColor;

  @override
  Widget build(BuildContext context) {
    final extraString = GoRouterState.of(context).pathParameters['noteId'];
    var getNotes = ref.watch(noteNotifierProvider);
    var transformNotes = getNotes.toList();
    var note = transformNotes[int.parse(extraString!)];

    setState(() {
      _oldColor = note.color;
      _titleField = note.title;
      _descriptionField = note.description;
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leading: goBackButton(context),
        title: Text(editNote,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: standardFont)),
        actions: [
          IconButton(
            style: iconButtonStyle(context),
            icon: const Icon(Icons.circle, size: standardIcon),
            color: SwitchColor.switchColor(_color ?? _oldColor),
            onPressed: () => showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    title: Center(
                      child: Text(
                        pickColor,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: colors
                          .map((e) => TextButton.icon(
                                onPressed: () {
                                  setState(() {
                                    _color = e.values.first.toString();
                                  });

                                  Navigator.of(context).pop();
                                },
                                icon: colorClip(e.values.first.toString()),
                                label: Text(
                                  e.values.first.toString(),
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: standardFont),
                                ),
                              ))
                          .toList(),
                    ),
                  );
                }),
          ),
          IconButton(
              style: iconButtonStyle(context),
              icon: const Icon(Icons.save, size: standardIcon),
              color: Theme.of(context).colorScheme.primary,
              onPressed: () => {
                    if (_titleField != null && _descriptionField != null)
                      {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor:
                                  Theme.of(context).colorScheme.surface,
                              title: Icon(
                                Icons.info,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              content: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      prompt,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: standardFont),
                                    ),
                                  )
                                ],
                              ),
                              actionsAlignment: MainAxisAlignment.center,
                              actions: <Widget>[
                                SizedBox(
                                  width: 110,
                                  child: FilledButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: buttonStyle(
                                        context,
                                      ),
                                      child: Text(no,
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontSize: standardFont))),
                                ),
                                SizedBox(
                                  width: 110,
                                  child: FilledButton(
                                      onPressed: () {
                                        String? finalColor =
                                            _color ?? _oldColor;
                                        ref
                                            .read(noteNotifierProvider.notifier)
                                            .editNote(Note(
                                                id: note.id,
                                                title: "$_titleField",
                                                description:
                                                    "$_descriptionField",
                                                timestamp: _timestamp,
                                                color: "$finalColor"));
                                        Navigator.of(context).pop();
                                        ref.read(goRouterProvider).pop();
                                      },
                                      style: buttonStyle(
                                        context,
                                      ),
                                      child: Text(yes,
                                          style: TextStyle(
                                              color: Theme.of(context).colorScheme.primary,
                                              fontSize: standardFont))),
                                ),
                              ],
                            );
                          },
                        )
                      }
                    else
                      {}
                  }),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(standardSpacing),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        ),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        key: const Key(title),
                        maxLines: 1,
                        initialValue: note.title,
                        onChanged: (val) =>
                            {_titleField = val.isEmpty ? null : val},
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 55),
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.surface,
                          filled: false,
                          hintText: title,
                          hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary),
                          enabledBorder: transparentEnabledBorder(),
                          focusedBorder: transparentFocusedBorder(),
                          errorBorder: transparentEnabledBorder(),
                          focusedErrorBorder: transparentErrorBorder(),
                          // errorStyle: errorStyle(),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return errorEntry;
                          }
                          _titleField = value;
                          return null;
                        },
                      ),
                      TextFormField(
                        key: const Key(description),
                        initialValue: note.description,
                        onChanged: (val) =>
                            {_descriptionField = val.isEmpty ? null : val},
                        maxLines: 10,
                        enableSuggestions: false,
                        autocorrect: false,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: standardFont),
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.surface,
                          filled: false,
                          hintText: description,
                          hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary),
                          enabledBorder: transparentEnabledBorder(),
                          focusedBorder: transparentFocusedBorder(),
                          errorBorder: transparentEnabledBorder(),
                          focusedErrorBorder: transparentErrorBorder(),
                          // errorStyle: errorStyle()
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return errorEntry;
                          }
                          _descriptionField = value;
                          return null;
                        },
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
