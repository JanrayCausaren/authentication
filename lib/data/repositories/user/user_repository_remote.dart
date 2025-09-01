import 'package:authentication_app/data/repositories/user/user_repository.dart';
import 'package:authentication_app/data/services/api/api_client.dart';
import 'package:authentication_app/domain/models/user/user.dart';
import 'package:authentication_app/ui/utils/result.dart';

class UserRepositoryRemote extends UserRepository{
  UserRepositoryRemote({required ApiClientService apiClient}) : _apiClient = apiClient;


  final ApiClientService _apiClient;


  @override
  Future<Result<User>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

}