class User {
  User({
    this.updatedAt,
    required this.id,
    required this.email,
    required this.password,
    required this.lastName,
    required this.firstName,
    required this.createdAt,
  });

  int id;
  String email;
  String lastName;
  String password;
  String createdAt;
  String firstName;
  String? updatedAt;
}
