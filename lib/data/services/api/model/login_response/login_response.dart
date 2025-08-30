class LoginResponse {
  final String token;
  // final String userId;
  // final int expiresIn; // in seconds
  final bool isSuccess;
  final String message;

  const LoginResponse({
    required this.isSuccess,
    required this.message,
    required this.token,
    // required this.userId,
    // required this.expiresIn,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      isSuccess: json['success'],
      message: json['message'],
      token: json['token'] as String,
      // userId: json['userId'] as String,
      // expiresIn: json['expiresIn'] as int,
    );
  }

}
