import 'package:authentication_app/ui/utils/result.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

///implement secure storage service
///library help to secure the tokens or any sensitive data
///it will encrypt then stored to the hardware device

///Singleton
class SecureStorageService {
  SecureStorageService._internal();

  ///static, the field/method belongs to the class itself, not instances
  static final SecureStorageService _instance =
      SecureStorageService._internal();

  ///factory doesnt create new object its commonly used in Singleton, cached objects
  ///required return objects
  factory SecureStorageService() {
    return _instance;
  }

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const String _tokenKey = 'JWToken';
  String get token => _tokenKey;

  Future<Result<void>> saveToken(String token) async {
    try {
      final result = await _secureStorage.write(key: _tokenKey, value: token);
      return Result.ok(result);
    } catch (e) {
      Result.error(throw Exception('Failed to save token: $e'));
    }
  }

  Future<Result<void>> deleteToken(String tokenKey) async {
    try {
      final result = await _secureStorage.delete(key: _tokenKey);
      return Result.ok(result);
    } catch (e) {
      return Result.error(throw Exception('Failed to delete token : $e'));
    }
  }

  Future<Result<String?>> readToken(String key) async {

    try {
      await Future.delayed(Duration(seconds: 4));
      final result = await _secureStorage.read(key: key);
      return Result.ok(result);
    } catch (e) {
      return Result.error(throw Exception('Failed to get token : $e'));
    }
  }

  // Future<Result<String?>> readToken(String key) async {
  //   try {
  //     final _result = await _secureStorage.read(key: key);
  //     print(_result);
  //     return Result.ok(_result);
  //   } catch (e) {
  //     return Result.error(throw Exception('Failed to read token $e'));
  //   }
  // }
}
