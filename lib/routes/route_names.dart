class RouteNames {
  static const home = "/notes";
  static const about = "/about";
  static const login = "/login";
  static const signup = "/signup";
  static const onboard = "/onboard";
  static const settings = "/settings";

  static const search = "search";
  static const newN = "new";
  static const view = ":noteId";
  static const edit = "edit/:noteId";

  static const newNote = "/notes/$newN";
  static const searchNote = "/notes/$search";
  static viewNote(noteId) => "/notes/$noteId";
  static profile(userId) => "/profile/$userId";
  static editNote(noteId) => "/notes/edit/$noteId";
}
