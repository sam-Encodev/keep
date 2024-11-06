import 'package:flutter/material.dart';
import 'package:keep/providers/notes_provider.dart';

snackBar(context, {message, withAction = false, ref}) {
  final SnackBarAction? action = withAction
      ? SnackBarAction(
          label: 'Undo',
          onPressed: () {
            ref.read(noteNotifierProvider.notifier).undoRemove();
            ref.invalidate(noteNotifierProvider);
          },
        )
      : null;

  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
    ),
    action: action,
  ));
}
