import 'package:flutter/material.dart';
import 'package:keep/models/note.dart';
import 'package:keep/constants/text.dart';
import 'package:go_router/go_router.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/constants/widgets.dart';
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
        backgroundColor: Colors.black87,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            style: iconButtonStyle(),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.arrow_back, size: 30),
            color: Colors.white,
            onPressed: () => context.pop(),
          ),
        ),
        actions: [
          IconButton(
            style: iconButtonStyle(),
            icon: const Icon(Icons.circle),
            color: SwitchColor.switchColor(_color ?? _oldColor),
            onPressed: () => showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.grey[900],
                    title: const Center(
                      child: Text(
                        pickColor,
                        style: TextStyle(color: Colors.white),
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
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ))
                          .toList(),
                    ),
                  );
                }),
          ),
          IconButton(
              style: iconButtonStyle(),
              icon: const Icon(Icons.save),
              color: Colors.white,
              onPressed: () => {
                    if (_titleField != null && _descriptionField != null)
                      {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.grey[900],
                              title: const Icon(
                                Icons.info,
                                color: Colors.white,
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
                                          color: Colors.red, fontSize: 20),
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
                                      style:
                                          buttonStyle(color: Colors.redAccent),
                                      child: const Text(no,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20))),
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
                                      style: buttonStyle(),
                                      child: const Text(yes,
                                          style: TextStyle(
                                              color: Colors.redAccent,
                                              fontSize: 20))),
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
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black87,
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
                        initialValue: note.title,
                        onChanged: (val) =>
                            {_titleField = val.isEmpty ? null : val},
                        maxLines: 1,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 55),
                        decoration: InputDecoration(
                          fillColor: Colors.black87,
                          filled: false,
                          hintText: title,
                          hintStyle: const TextStyle(color: Colors.white),
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        decoration: InputDecoration(
                          fillColor: Colors.black87,
                          filled: false,
                          hintStyle: const TextStyle(color: Colors.white),
                          hintText: description,
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
