class RouteName {
  static const home = "/notes";
  static const login = "/login";
  static const about = "/about";
  static const signup = "/signup";
  static const onboard = "/onboard";
  static const settings = "/settings";

  static const add = "add";
  static const view = ":noteId";
  static const search = "search";
  static const edit = "edit/:noteId";

  static const newNote = "/notes/$add";
  static const searchNote = "/notes/$search";
  static viewNote(noteId) => "/notes/$noteId";
  static profile(userId) => "/profile/$userId";
  static editNote(noteId) => "/notes/edit/$noteId";
}
