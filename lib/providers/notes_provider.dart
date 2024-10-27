import 'package:jiffy/jiffy.dart';
import 'package:keep/models/note.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class NoteNotifier extends Notifier<List<Note>> {
  @override
  List<Note> build() => [
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
        Note(
            id: 3,
            title: "Game",
            description: "I lied",
            timestamp: "2024-03-02T15:18:29.922343",
            color: "grey"),
        Note(
            id: 4,
            title: "Sleep",
            description: "I lied",
            timestamp: Jiffy.parse(DateTime.timestamp().toString())
                .subtractDuration(const Duration(days: 10, hours: 6))
                .format(),
            color: "blue"),
      ];

  void addNote(Note note) {
    if (!state.contains(note)) {
      state = [...state, note];
    }
  }

  void removeNote(noteID) {
    state = state.where((p) => p.id != noteID).toList();
  }

  void editNote(Note note) {
    var oldNote = state.where((p) => p.id == note.id);
    oldNote.first.title = note.title;
    oldNote.first.description = note.description;
    oldNote.first.color = note.color;
    oldNote.first.timestamp = note.timestamp;

    state = [...state];
  }
}

final noteNotifierProvider = NotifierProvider<NoteNotifier, List<Note>>(() {
  return NoteNotifier();
});
