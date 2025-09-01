import 'package:authentication_app/data/repositories/auth/registration/auth_repository_registration.dart';
import 'package:authentication_app/data/services/api/model/signup/signup_request.dart';
import 'package:authentication_app/data/services/api/model/signup/signup_response.dart';
import 'package:authentication_app/data/services/api/api_client.dart';
import 'package:authentication_app/data/services/local/secure_storage_service.dart';
import 'package:authentication_app/ui/utils/result.dart';

class AuthRepositoryRegistrationRemote extends AuthRepositoryRegistration {
  AuthRepositoryRegistrationRemote({
    required ApiClientService services,
    required SecureStorageService secureStorage,
  }) : _services = services,
       _secureStorageService = secureStorage;

  final ApiClientService _services;
  final SecureStorageService _secureStorageService;
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
          final saveTokenMethod = await _secureStorageService.saveToken(
            result.value.token,
          );
          if (saveTokenMethod is Ok) {
            print('token is already saved!');
          }

          final tokenValue = await _secureStorageService.readToken(
            _secureStorageService.token,
          );

          print('The token value is : $tokenValue');

          return Result.ok(null);
        case Error<SignupResponse>():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }
}
