import 'package:authentication_app/data/repositories/auth/registration/auth_repository_registration.dart';
import 'package:authentication_app/ui/utils/command.dart';
import 'package:authentication_app/ui/utils/result.dart';

class RegistrationViewmodel {
  RegistrationViewmodel({
    required AuthRepositoryRegistration registrationRepository,
  }) : _registrationRepository = registrationRepository {
    signup = Command1<void, (String email, String password)>(_signup);
  }

  final AuthRepositoryRegistration _registrationRepository;
  late Command1 signup;

  Future<Result<void>> _signup((String, String) credentials) async {
    final (email, password) = credentials;
    final result = await _registrationRepository.signIn(
      email: email,
      password: password,
    );

    print('this is in the viewmodel $result');
    return result;
  }
}
