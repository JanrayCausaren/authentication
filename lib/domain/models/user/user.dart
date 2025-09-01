class User {

  User({required this.token, required this.id, required this.email, required this.role});


  final String token;
  final String id;
  final String email;
  final UserRole role;

}

  enum UserRole { student, teacher, admin, unknown }



