class SignupResponse {
  final String token;
  final bool isSuccess;
  final String message;

  const SignupResponse({
    required this.isSuccess,
    required this.message,
    required this.token,  

  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      isSuccess: json['success'],
      message: json['message'],
      token: json['token'],
    );
  }

}
