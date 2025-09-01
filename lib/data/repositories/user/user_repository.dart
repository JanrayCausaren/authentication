import 'package:authentication_app/domain/models/user/user.dart';
import 'package:authentication_app/ui/utils/result.dart';

abstract class UserRepository {
  Future<Result<User>> getUser();
}
