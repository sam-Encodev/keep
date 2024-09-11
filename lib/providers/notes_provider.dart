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
            color: "lightGreenAccent"),
        Note(
            id: 3,
            title: "Game",
            description: "I lied",
            timestamp: "2024-03-02T15:18:29.922343",
            color: "white"),
        Note(
            id: 4,
            title: "Sleep",
            description: "I lied",
            timestamp: Jiffy.parse(DateTime.timestamp().toString())
                .subtractDuration(const Duration(days: 10, hours: 6))
                .format(),
            color: "blue"),
        Note(
            id: 5,
            title: "Game",
            description: "I lied",
            timestamp: "2024-03-02T15:18:29.922343",
            color: "indigo"),
        Note(
            id: 6,
            title: "Sleep",
            description: "I lied",
            timestamp: Jiffy.parse(DateTime.timestamp().toString())
                .subtractDuration(const Duration(days: 10, hours: 6))
                .format(),
            color: "orange"),
        Note(
            id: 7,
            title: "Game",
            description: "I lied",
            timestamp: "2024-03-02T15:18:29.922343",
            color: "green"),
        Note(
            id: 8,
            title: "Sleep",
            description: "I lied",
            timestamp: Jiffy.parse(DateTime.timestamp().toString())
                .subtractDuration(const Duration(days: 10, hours: 6))
                .format(),
            color: "lightGreenAccent"),
        Note(
            id: 9,
            title: "Game",
            description: "I lied",
            timestamp: "2024-03-02T15:18:29.922343",
            color: "red"),
        Note(
            id: 10,
            title: "Sleep",
            description: "I lied",
            timestamp: Jiffy.parse(DateTime.timestamp().toString())
                .subtractDuration(const Duration(days: 10, hours: 6))
                .format(),
            color: "yellow"),
        // Note(
        //     id: 11,
        //     title: "Game",
        //     description: "I lied",
        //     timestamp: "2024-03-02T15:18:29.922343",
        //     color: "red"),
        // Note(
        //     id: 12,
        //     title: "Sleep",
        //     description: "I lied",
        //     timestamp: Jiffy.parse(DateTime.timestamp().toString())
        //         .subtractDuration(const Duration(days: 10, hours: 6))
        //         .format(),
        //     color: "yellow"),
        // Note(
        //     id: 13,
        //     title: "Game",
        //     description: "I lied",
        //     timestamp: "2024-03-02T15:18:29.922343",
        //     color: "red"),
        // Note(
        //     id: 14,
        //     title: "Sleep",
        //     description: "I lied",
        //     timestamp: Jiffy.parse(DateTime.timestamp().toString())
        //         .subtractDuration(const Duration(days: 10, hours: 6))
        //         .format(),
        //     color: "yellow"),
      ];

  void addNote(Note note) {
    if (!state.contains(note)) {
      state = [...state, note];
    }
  }

  void removeNote(noteID) {
    state = state.where((p) => p.id != noteID).toList();

    // if (state.contains(noteID)) {
    //   state = state.where((p) => p.id != noteID).toSet();
    // }
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
