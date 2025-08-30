import 'package:authentication_app/data/repositories/auth/auth_repository.dart';
import 'package:authentication_app/data/services/api/model/login_request/login_request.dart';
import 'package:authentication_app/data/services/api/model/login_response/login_response.dart';
import 'package:authentication_app/data/services/api/services.dart';
import 'package:authentication_app/data/services/local/secure_storage_service.dart';
import 'package:authentication_app/ui/utils/result.dart';

class AuthRepositoryRemote extends AuthRepository {
  AuthRepositoryRemote({
    required Services services,
    required SecureStorageService secureStorageService,
  }) : _services = services,
       _secureStorageService = secureStorageService;

  final Services _services;
  final SecureStorageService _secureStorageService;
  bool? _isAuthenticated;
  String? _authtoken;
  bool? _isLoaded;

  // /// Fetch token from shared preferences
  // Future<void> _fetch() async {
  //   final result = await _sharedPreferencesService.fetchToken();
  //   switch (result) {
  //     case Ok<String?>():
  //       _authToken = result.value;
  //       _isAuthenticated = result.value != null;
  //     case Error<String?>():
  //       _log.severe(
  //         'Failed to fech Token from SharedPreferences',
  //         result.error,
  //       );
  //   }
  // }

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
        case Ok<LoginResponse>():
          _isAuthenticated = true;
          _authtoken = result.value.token;

          print('this is the authrepo, the user is authenticated');
          print(_authtoken);
          return await _secureStorageService.saveToken(result.value.token);
        case Error<LoginResponse>():
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
      switch (deleteToken) {
        case Ok<void>():
          _authtoken = null;
          return Result.ok(null);
        case Error<void>():
          return Result.error(deleteToken.error);
      }
    } finally {
      notifyListeners();
    }
  }

  @override
  bool get isLoaded  {
    if (_isLoaded != null) {
      return _isLoaded!;
    }
    return _isLoaded ?? false;
  }

  // Future<void> fetchToken() async {
  //   final result = await _secureStorageService.readToken(
  //     _secureStorageService.token,
  //   );
  //   try {
  //     switch (result) {
  //       case Ok<String?>():
  //         _authtoken = result.value;
  //         _isAuthenticated = _isAuthenticated != null;

  //       case Error<String?>():
  //         print('Error from auth repo');
  //     }
  //   } catch (e) {
  //     'Error fetching token from authrepository $e';
  //   } finally {
  //     notifyListeners();
  //   }
  // }

  Future<void> loadFromStorage() async {
    final accessToken = await _secureStorageService.readToken(
      _secureStorageService.token,
    );
    switch (accessToken) {
      case Ok<String?>():
        print('Succesful read token : ${accessToken.value}');
        _isAuthenticated = accessToken.value != null;
        _authtoken = accessToken.value;
        _isLoaded = true;
        notifyListeners();

      case Error<String?>():
      

        print('No token in this device');
    }
  }
}
