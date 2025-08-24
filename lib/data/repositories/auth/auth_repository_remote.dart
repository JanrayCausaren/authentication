import 'package:authentication_app/data/repositories/auth/auth_repository.dart';
import 'package:authentication_app/data/services/api/services.dart';
import 'package:authentication_app/ui/utils/result.dart';

class AuthRepositoryRemote extends AuthRepository {
  AuthRepositoryRemote({required Services services}) : _services = services;

  final Services _services;

  @override
  // TODO: implement isAuthenticated
  Future<bool> get isAuthenticated => throw UnimplementedError();

  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
