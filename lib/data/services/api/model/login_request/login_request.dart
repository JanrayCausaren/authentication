class LoginRequest {
  const LoginRequest({required this.email, required this.password});

  // Convert object → JSON
  Map<String, dynamic> toJson() {
    return {"username": email, "password": password};
  }

  factory LoginRequest.toJson(Map<String, Object?> json) {
    return LoginRequest(
      email: json["username"] as String,
      password: json["password"] as String,
    );
  }

  final String email;
  final String password;
}
