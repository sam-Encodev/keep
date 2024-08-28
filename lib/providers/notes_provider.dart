import 'package:keep/models/note.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class NoteNotifier extends Notifier<Set<Note>> {
  @override
  Set<Note> build() {
    return {
      Note(
          id: 0,
          title: "Game",
          description: "I lied",
          timestamp: "2024-03-02T15:18:29.922343",
          color: "red"),
      Note(
          id: 1,
          title: "Sleep",
          description: "I lied",
          timestamp: DateTime.timestamp().toString(),
          color: "yellow"),
    };
  }

  void addNote(Note note) {
    if (!state.contains(note)) {
      state = {...state, note};
    }
  }

  void removeNote(noteID) {
    state = state.where((p) => p.id != noteID).toSet();

    // if (state.contains(noteID)) {
    //   state = state.where((p) => p.id != noteID).toSet();
    // }
  }

  void editNote(Note note) {
    // Logger.info({"new": note.color});
    var oldNote = state.where((p) => p.id == note.id);
    // Logger.info({"old": oldNote.first.color});
    oldNote.first.title = note.title;
    oldNote.first.description = note.description;
    oldNote.first.color = note.color;
    oldNote.first.timestamp = note.timestamp;

    state = {...state};
  }
}

final noteNotifierProvider = NotifierProvider<NoteNotifier, Set<Note>>(() {
  return NoteNotifier();
});
