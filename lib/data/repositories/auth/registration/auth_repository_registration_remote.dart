import 'package:authentication_app/data/repositories/auth/registration/auth_repository_registration.dart';
import 'package:authentication_app/data/services/api/model/signup/signup_request.dart';
import 'package:authentication_app/data/services/api/model/signup/signup_response.dart';
import 'package:authentication_app/data/services/api/services.dart';
import 'package:authentication_app/ui/utils/result.dart';

class AuthRepositoryRegistrationRemote extends AuthRepositoryRegistration {
  AuthRepositoryRegistrationRemote({required Services services})
    : _services = services;

  final Services _services;
  bool? _isRegistered;

  @override
  Future<bool> get isRegistered async {
    if (_isRegistered != null) {
      return _isRegistered!;
    }

    return _isRegistered ?? false;
  }

  @override
  Future<Result<void>> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _services.signup(
      SignupRequest(username: email, password: password),
    );

    try {
      switch (result) {
        case Ok<SignupResponse>():
       
          return Result.ok(null);
        case Error<SignupResponse>():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }
}
