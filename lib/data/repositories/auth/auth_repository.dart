import 'package:flutter/material.dart';
import 'package:flutter_app_template/ui/utils/result.dart';

abstract class AuthRepository extends ChangeNotifier{

  /// Returns true when the user is logged in
  /// Returns [Future] because it will load a stored auth state the first time.

  Future<bool> get isAuthenticated;

  ///perform login
  Future<Result<void>> login({required String email, required String password});

  ///perform logout
  Future<Result<void>> logout();
}