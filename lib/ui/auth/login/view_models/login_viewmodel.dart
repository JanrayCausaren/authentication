import 'package:authentication_app/data/repositories/auth/auth_repository.dart';
import 'package:authentication_app/ui/utils/command.dart';
import 'package:authentication_app/ui/utils/result.dart';

class LoginViewModel {
  LoginViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository {
    login = Command1<void, (String email, String password)>(_login);
  }

  late Command1 login;
  final AuthRepository _authRepository;

  Future<Result<void>> _login((String, String) credentials) async {
    final (email, password) = credentials;
    final result = await _authRepository.login(
      email: email,
      password: password,
    );

    if (result is Error<void>) {
      print('Login Failed! ${result.error}');
    }

    return result;
  }
}
