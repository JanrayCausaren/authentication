import 'package:authentication_app/ui/utils/result.dart';
import 'package:flutter/material.dart';

abstract class AuthRepositoryRegistration extends ChangeNotifier{

  ///returns true if the user is successfully registered 
  Future<bool> get isRegistered;

  Future<Result<void>> signIn ({required String email, required String password});


}