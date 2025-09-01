import 'dart:convert';

import 'package:authentication_app/data/services/api/model/auth/auth_api_model.dart';
import 'package:authentication_app/data/services/api/model/auth/login_request.dart';
import 'package:authentication_app/data/services/api/model/signup/signup_request.dart';
import 'package:authentication_app/data/services/api/model/signup/signup_response.dart';
import 'package:authentication_app/data/services/api/model/user/user_api_model.dart';
import 'package:authentication_app/ui/utils/result.dart';
import 'package:http/http.dart' as http;


typedef AuthHeaderProvider = String? Function();

class ApiClientService {
  ApiClientService({String? host, int? port, http.Client? client})
    : _host = host ?? 'localhost',
      _port = port ?? 3000,
      _client = client ?? http.Client()
      ;

  final String _host; 
  final int _port;
  final http.Client _client;

   AuthHeaderProvider? _authHeaderProvider;

   set authHeaderProvider(AuthHeaderProvider authHeaderProvider){
    _authHeaderProvider = authHeaderProvider; 
   }

  String get _baseURL => "$_host:$_port";

  Uri getUrl(String endpoint) {
    final url = "http://$_baseURL$endpoint";
    return Uri.parse(url);
  }


  
  /// Builds headers (like your `_authHeader` method)
  Future<Map<String, String>> _authHeader([Map<String, String>? extra]) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final header = _authHeaderProvider?.call();
    if (header != null) {
      headers['Authorization'] = header; // 👈 same as HttpHeaders.authorizationHeader
    }

    if (extra != null) {
      headers.addAll(extra);
    }

    return headers;
  }


  Future<Result<AuthApiModel>> login(LoginRequest request) async {
    final endpoint = '/login';
    final url = getUrl(endpoint);

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()), // ✅ send JSON
    );

    try {
      await Future.delayed(Duration(seconds: 3));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        print('-------');
        print(json);
        print(Result.ok(AuthApiModel.fromJson(json)));
        print('------------');
        return Result.ok(AuthApiModel.fromJson(json)); // ✅ parse JSON
      } else {
        return Result.error(
          throw Exception("Failed to login: ${response.statusCode}"),
        );
      }
    } on Exception catch (error) {
      print('this is the services error');
      return Result.error(error);
    }
  }

  Future<Result<SignupResponse>> signup(SignupRequest request) async {
    const endpoint = '/signup';
    final url = getUrl(endpoint);

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()), // ✅ send JSON
    );

    final json = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
        await Future.delayed(Duration(seconds: 2));
        print(json);
        return Result.ok(SignupResponse.fromJson(json));
      } else {
        return Result.error(
          throw Exception('Failed to signup: ${response.statusCode}'),
        );
      }
    } on Exception catch (e) {
      print('service error, signup error');
      return Result.error(e);
    }
  }

  // Future<Result<UserApiModel>> getUser() async{
  //   final url = getUrl('/user');
  //   final client =  

  //   final response = await http.get(url, headers: {"Content-Type": "application/json"}, );

  //   return 
  // }
}


