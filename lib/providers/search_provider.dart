import 'package:keep/models/note.dart';
import 'package:keep/providers/notes_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchNotifier extends Notifier<List<Note>> {
  @override
  List<Note> build() => [];

  void search(String query) {
    var getNotes = ref.watch(noteNotifierProvider);

    if (query.isNotEmpty) {
      state = getNotes
          .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      state = [];
    }
  }
}

final searchNotifierProvider = NotifierProvider<SearchNotifier, List<Note>>(() {
  return SearchNotifier();
});
