import 'package:authentication_app/data/services/api/model/request_interface.dart';

class SignupRequest extends RequestInterface {
  SignupRequest({required this.username, required this.password});

  final String username;
  final String password;

  @override
  Map<String, dynamic> toJson() {
    return {"username": username, "password": password};
  }
}
