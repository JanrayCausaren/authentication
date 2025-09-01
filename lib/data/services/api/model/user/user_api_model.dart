class UserApiModel {
  UserApiModel({
    required this.userId,
    required this.email,
    required this.role,
    required this.accountCreated,
  });

  final int userId;
  final String email;
  final String role;
  final String accountCreated;

  

  factory UserApiModel.fromJson(Map<String, dynamic> json) {
    return UserApiModel(
      userId: json['user_id'],
      email: json['email'],
      role: json['role'],
      accountCreated: json['account_created'],
    );
  }
}
