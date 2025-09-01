class LoginRequest {
  const LoginRequest({required this.email, required this.password});

  // Convert object → JSON
  Map<String, dynamic> toJson() {
    return {"username": email, "password": password};
  }

  final String email;
  final String password;
}
