class RouteNames {
  static const home = "/";
  static const about = "/about";
  static const login = "/login";
  static const search = "/search";
  static const signup = "/signup";
  static const onboard = "/onboard";
  static const notesNew = "/notes/new";
  static viewNote(noteId) => "/notes/$noteId";
  static profile(userId) => "/profile/$userId";
  static editNote(noteId) => "/notes/edit/$noteId";
}
