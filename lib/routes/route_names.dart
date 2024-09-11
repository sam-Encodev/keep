class RouteNames {
  static const home = "/";
  static const about = "/about";
  static const login = "/login";
  static const search = "/search";
  static const signup = "/signup";
  static const onboard = "/onboard";
  static const notesNew = "/notes/new";
  static notesNoteId(noteId) => "/notes/$noteId";
  static notesEditNoteId(noteId) => "/notes/edit/$noteId";
  static viewProfile(userId) => "/profile/$userId";
  static editProfile(userId) => "/profile/edit/$userId";
}
