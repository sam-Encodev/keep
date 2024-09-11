class Profile {
  Profile({
    required this.id,
    required this.email,
    required this.password,
    required this.lastName,
    required this.firstName,
    required this.timestamp,
  });

  int id;
  String email;
  String lastName;
  String password;
  String timestamp;
  String firstName;
}
