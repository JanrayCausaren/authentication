class AuthApiModel {
  AuthApiModel({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  final String accessToken;
  final String refreshToken;
  final int expiresIn;


  factory AuthApiModel.fromJson(Map<String, dynamic> json) {
    return AuthApiModel(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      expiresIn: json['expiresIn'],
    );
  }
}
