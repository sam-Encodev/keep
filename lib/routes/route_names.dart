class RouteNames {
  static const home = "/notes";
  static const about = "/about";
  static const login = "/login";
  static const signup = "/signup";
  static const onboard = "/onboard";
  static const search = "search";
  static const newNote = "new";
  static const view = ":noteId";
  static const edit = "edit/:noteId";

  static const searchNote = "/notes/$search";
  static viewNote(noteId) => "/notes/$noteId";
  static profile(userId) => "/profile/$userId";
  static editNote(noteId) => "/notes/edit/$noteId";
}
