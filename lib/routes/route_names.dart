class RouteNames {
  static const home = "/";
  static const about = "/about";
  static const login = "/login";
  static const search = "/search";
  static const signup = "/signup";
  static const onboard = "/onboard";
  static const notesNew = "/notes/new";
  static viewNote(noteId) => "/notes/$noteId";
  static editNote(noteId) => "/notes/edit/$noteId";
  static viewProfile(userId) => "/profile/$userId";
  static editProfile(userId) => "/profile/edit/$userId";
}
