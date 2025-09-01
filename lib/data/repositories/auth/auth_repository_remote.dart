import 'package:authentication_app/data/repositories/auth/auth_repository.dart';
import 'package:authentication_app/data/services/api/model/auth/auth_api_model.dart';
import 'package:authentication_app/data/services/api/model/auth/login_request.dart';
import 'package:authentication_app/data/services/api/api_client.dart';
import 'package:authentication_app/data/services/local/secure_storage_service.dart';
import 'package:authentication_app/ui/utils/result.dart';

class AuthRepositoryRemote extends AuthRepository {
  AuthRepositoryRemote({
    required ApiClientService services,
    required SecureStorageService secureStorageService,
  }) : _services = services,
       _secureStorageService = secureStorageService {
    services.authHeaderProvider = _authHeaderProvider;
  }

  final ApiClientService _services;
  final SecureStorageService _secureStorageService;
  bool? _isAuthenticated;
  String? _authtoken; 

  @override
  Future<bool> get isAuthenticated async {
    if (_isAuthenticated != null) {
      return _isAuthenticated!;
    }
    await loadFromStorage();

    return _isAuthenticated ?? false;
  }

  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) async {
    final result = await _services.login(
      LoginRequest(email: email, password: password),
    );

    print(LoginRequest(email: email, password: password).toJson());
    try {
      switch (result) {
        case Ok<AuthApiModel>():
          _isAuthenticated = true;
          _authtoken = result.value.accessToken;

          print('this is the authrepo, the user is authenticated');
          print(_authtoken);
          return await _secureStorageService.saveToken(
            result.value.accessToken,
          );
        case Error<AuthApiModel>():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> logout() async {
    final deleteToken = await _secureStorageService.deleteToken(
      _secureStorageService.token,
    );

    try {
      print('deleting token');
      switch (deleteToken) {
        case Ok<void>():
          _authtoken = null;
          _isAuthenticated = false;
          print('deleting token');
          return deleteToken;
        case Error<void>():
          return Result.error(deleteToken.error);
      }
    } finally {
      notifyListeners();
    }
  }

  Future<void> loadFromStorage() async {
    final accessToken = await _secureStorageService.readToken(
      _secureStorageService.token,
    );
    switch (accessToken) {
      case Ok<String?>():
        print('Succesful read token : ${accessToken.value}');
        _isAuthenticated = accessToken.value != null;
        _authtoken = accessToken.value;

        print('isAuthenticaded value is : $_isAuthenticated');
        notifyListeners();

      case Error<String?>():
        print('No token in this device');
    }
  }

  String? _authHeaderProvider() =>
      _authtoken != null ? 'Bearer $_authtoken' : null;
}
