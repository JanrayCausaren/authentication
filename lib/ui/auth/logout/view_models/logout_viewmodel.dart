import 'package:authentication_app/data/repositories/auth/auth_repository.dart';
import 'package:authentication_app/ui/utils/command.dart';
import 'package:authentication_app/ui/utils/result.dart';

class LogoutViewmodel {
  LogoutViewmodel({required AuthRepository authRepository})
    : _authRepository = authRepository {
      logout = Command0<void> (_logout);
    }

  final AuthRepository _authRepository;
  late Command0 logout;

  Future<Result<void>> _logout() async {
    final action = await _authRepository.logout();

    if (action is Error<void>){
      print('Error Logging out. This is in viewmodel');
    }

    return action;
  }
}
