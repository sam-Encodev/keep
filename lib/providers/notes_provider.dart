import 'package:jiffy/jiffy.dart';
import 'package:keep/models/note.dart';
import 'package:keep/providers/notes_mod_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteNotifier extends Notifier<List<Note>> {
  @override
  List<Note> build() => [
        Note(
            id: 1,
            title: "Sleep",
            description: "I lied",
            timestamp: Jiffy.parse(DateTime.timestamp().toString())
                .subtractDuration(const Duration(days: 10, hours: 6))
                .format(),
            color: "yellow"),
        Note(
            id: 2,
            title: "Sleep",
            description: "I lied",
            timestamp: Jiffy.parse(DateTime.timestamp().toString())
                .subtractDuration(const Duration(days: 10, hours: 6))
                .format(),
            color: "pink"),
      ];

  Note findNote(noteID) {
    var note = state.firstWhere((test) => test.id == noteID);
    return note;
  }

  void addNote(Note note) {
    if (!state.contains(note)) {
      state = [...state, note];
    }
  }

  void removeNote(noteID, index) {
    final note = state.elementAt(index);
    ref.read(noteModeNotifierProvider.notifier).setNote(index, note);
    state = state.where((p) => p.id != noteID).toList();
  }

  void undoRemove() {
    final getNote = ref.watch(noteModeNotifierProvider);
    state.insert(getNote["index"], getNote["note"]);
  }

  void editNote(Note note) {
    var oldNote = state.where((p) => p.id == note.id);
    oldNote.first.title = note.title;
    oldNote.first.color = note.color;
    oldNote.first.timestamp = note.timestamp;
    oldNote.first.description = note.description;

    state = [...state];
  }
}

final noteNotifierProvider = NotifierProvider<NoteNotifier, List<Note>>(() {
  return NoteNotifier();
});
