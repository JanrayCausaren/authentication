class User {
  User( {
    required this.id,
    required this.email,
    required this.role,
    required this.accountCreated,
  });


  final String id;
  final String email;
  final UserRole role;
  final String accountCreated;
}

enum UserRole { student, teacher, admin, unknown }
 