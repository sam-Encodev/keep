class User {
  User({
    this.email,
    this.password,
    this.updatedAt,
    this.createdAt,
    required this.id,
    required this.lastName,
    required this.firstName,
  });

  int id;
  String? email;
  String lastName;
  String? password;
  String firstName;
  String? createdAt;
  String? updatedAt;
}
