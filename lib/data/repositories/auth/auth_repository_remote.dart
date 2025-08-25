import 'package:authentication_app/data/repositories/auth/auth_repository.dart';
import 'package:authentication_app/data/services/api/model/login_request/login_request.dart';
import 'package:authentication_app/data/services/api/model/login_response/login_response.dart';
import 'package:authentication_app/data/services/api/services.dart';
import 'package:authentication_app/ui/utils/result.dart';

class AuthRepositoryRemote extends AuthRepository {
  AuthRepositoryRemote({required Services services}) : _services = services;

  final Services _services;

  bool? _isAuthenticated;
  String? _token;

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
  // TODO: implement isAuthenticated
  Future<bool> get isAuthenticated async {
    if (_isAuthenticated != null) {
      return _isAuthenticated!;
    }

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

          print('this is the authrepo, the user is authenticated');

          return success();
        case Error<LoginResponse>():
          return Result.error(result.error);
      }
    } finally {
      notifyListeners();
    }
  }

  Future<Result<void>> success() async {
    try {
      // final sharedPreferences = await SharedPreferences.getInstance();
      // if (token == null) {
      //   _log.finer('Removed token');
      //   await sharedPreferences.remove(_tokenKey);
      // } else {
      //   _log.finer('Replaced token');
      //   await sharedPreferences.setString(_tokenKey, token);
      // }
      print('sucess the user is authenticated');
      return const Result.ok(null);
    } on Exception catch (e) {
      // _log.warning('Failed to set token', e);
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
