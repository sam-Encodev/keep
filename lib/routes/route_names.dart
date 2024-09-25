class RouteNames {
  static const home = "/notes";
  static const about = "/about";
  static const login = "/login";
  static const signup = "/signup";
  static const onboard = "/onboard";
  static const search = "search";
  static const newNote = "new";
  static viewNote(noteId) => "/$noteId";
  static profile(userId) => "/profile/$userId";
  static editNote(noteId) => "/notes/edit/$noteId";
}
