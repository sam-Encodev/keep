import 'package:flutter/material.dart';
import 'package:keep/models/note.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/utilities/styles.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/components/go_back.dart';
import 'package:keep/components/color_clip.dart';
import 'package:keep/utilities/switch_color.dart';
import 'package:keep/providers/notes_provider.dart';
import 'package:keep/providers/router_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNote extends ConsumerStatefulWidget {
  const AddNote({super.key});

  @override
  ConsumerState<AddNote> createState() => AddNoteForm();
}

class AddNoteForm extends ConsumerState<AddNote> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _titleField;
  String? _descriptionField;
  String? _color = colors[2].values.first;
  final String _timestamp = DateTime.timestamp().toString();

  bool _submitted = false;

  @override
  Widget build(BuildContext context) {
    var getNotes = ref.watch(noteNotifierProvider);
    var index = getNotes.length;

    return Scaffold(
      appBar: AppBar(
        leading: GoBack(),
        title: Text(newNote, style: TextStyle(fontSize: standardFont)),
        actions: [
          IconButton(
            style: iconButtonStyle(context),
            icon: const Icon(Icons.circle, size: standardIcon),
            color: SwitchColor.switchColor(_color!),
            onPressed: () => showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Center(
                      child: Text(
                        pickColor,
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
                                  style: TextStyle(fontSize: standardFont, color: Theme.of(context).colorScheme.onPrimaryContainer),
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
              onPressed: () => {
                    setState(() => _submitted = true),
                    if (_formKey.currentState!.validate())
                      {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Icon(
                                Icons.info,
                                size: maxIcons,
                              ),
                              content: Text(
                                prompt,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: standardFont),
                              ),
                              actionsAlignment: MainAxisAlignment.center,
                              actions: <Widget>[
                                OutlinedButton(
                                    style: textButtonStyle(context,
                                        type: "secondary"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(no,
                                        style:
                                            TextStyle(fontSize: standardFont))),
                                TextButton(
                                    style: textButtonStyle(context),
                                    onPressed: () => {
                                          ref
                                              .read(
                                                  noteNotifierProvider.notifier)
                                              .addNote(Note(
                                                  id: index,
                                                  title: "$_titleField",
                                                  description:
                                                      "$_descriptionField",
                                                  timestamp: _timestamp,
                                                  color: "$_color")),
                                          Navigator.of(context).pop(),
                                          ref
                                              .read(goRouterProvider)
                                              .go(RouteNames.home)
                                        },
                                    child: Text(yes,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontSize: standardFont))),
                              ],
                            );
                          },
                        )
                      },
                  }),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(standardSpacing),
        width: double.infinity,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Form(
                  key: _formKey,
                  autovalidateMode: _submitted
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        key: const Key(title),
                        maxLines: 1,
                        style: TextStyle(fontSize: maxFont),
                        decoration: InputDecoration(
                          filled: false,
                          hintText: title,
                          hintStyle: hintStyle(context),
                          enabledBorder: transparentEnabledBorder(),
                          focusedBorder: transparentFocusedBorder(),
                          errorBorder: transparentEnabledBorder(),
                          focusedErrorBorder: transparentErrorBorder(),
                          errorStyle: errorStyle(context),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return errorEntry;
                          }
                          _titleField = value;
                          return null;
                        },
                      ),
                      TextFormField(
                        key: const Key(description),
                        maxLines: 10,
                        enableSuggestions: false,
                        autocorrect: false,
                        style: TextStyle(fontSize: standardFont),
                        decoration: InputDecoration(
                          filled: false,
                          hintText: description,
                          hintStyle: hintStyle(context),
                          enabledBorder: transparentEnabledBorder(),
                          focusedBorder: transparentFocusedBorder(),
                          errorBorder: transparentEnabledBorder(),
                          focusedErrorBorder: transparentErrorBorder(),
                          errorStyle: errorStyle(context),
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
