import 'package:authentication_app/data/repositories/auth/auth_repository.dart';
import 'package:authentication_app/ui/utils/result.dart';

class AuthRepositoryDev extends AuthRepository {
  /// User is always authenticated in dev scenarios
  @override
  Future<bool> get isAuthenticated => Future.value(true);

  /// Login is always successful in dev scenarios
  @override
  Future<Result<void>> login({
    required String email,
    required String password,
  }) async {
    print('user login');

    print(Result.ok(null));
    return Result.ok(null);
  }

  /// Logout is always successful in dev scenarios
  @override
  Future<Result<void>> logout() async {
    return const Result.ok(null);
  }
  
  @override
  
  bool get isLoaded => throw UnimplementedError();
}
