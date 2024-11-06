import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keep/models/note.dart';

class NotesModProvider extends Notifier {
  @override
  build() {
    return {
      "note": Note(
        id: 0,
        title: "",
        description: "",
        timestamp: "",
        color: "",
      ),
      "index": null
    };
  }

  void setNote(index, note) {
    state = {
      "index": index,
      "note": Note(
        id: note.id,
        title: note.title,
        description: note.description,
        timestamp: note.timestamp,
        color: note.color,
      )
    };
  }
}

final noteModeNotifierProvider = NotifierProvider(() {
  return NotesModProvider();
});
