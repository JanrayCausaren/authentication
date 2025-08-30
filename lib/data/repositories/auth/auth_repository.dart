import 'package:flutter/material.dart';
import 'package:authentication_app/ui/utils/result.dart';

abstract class AuthRepository extends ChangeNotifier{

  //returns true if the token is loaded in the device;
  bool get isLoaded;

  /// Returns true when the user is logged in
  /// Returns [Future] because it will load a stored auth state the first time.
  Future<bool> get isAuthenticated;

  ///perform login
  Future<Result<void>> login({required String email, required String password});

  ///perform logout
  Future<Result<void>> logout(); 
}