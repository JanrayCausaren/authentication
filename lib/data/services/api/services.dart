import 'dart:convert';

import 'package:authentication_app/data/services/api/model/login_request/login_request.dart';
import 'package:authentication_app/data/services/api/model/login_response/login_response.dart';
import 'package:authentication_app/data/services/api/model/signup/signup_request.dart';
import 'package:authentication_app/data/services/api/model/signup/signup_response.dart';
import 'package:authentication_app/ui/utils/result.dart';
import 'package:http/http.dart' as http;

class Services {
  Services({String? host, int? port})
    : _host = host ?? 'localhost',
      _port = port ?? 3000;

  final String _host;
  final int _port;

  String get _baseURL => "$_host:$_port";

  Uri getUrl(String endpoint) {
    final url = "http://$_baseURL$endpoint";
    return Uri.parse(url);
  }

  Future<Result<LoginResponse>> login(LoginRequest request) async {
    final endpoint = '/login';
    final url = getUrl(endpoint);

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()), // ✅ send JSON
    );

    try {
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        print('-------');
        print(json);
        print(Result.ok(LoginResponse.fromJson(json)));
        print('------------');
        return Result.ok(LoginResponse.fromJson(json)); // ✅ parse JSON
      } else {
        return Result.error(
          throw Exception("Failed to login: ${response.statusCode}"),
        );
      }
    } on Exception catch (error) {
      print('this is the services error');
      return Result.error(error);
    }

    //    final response = await http.post(
    //   url,
    //   headers: {"Content-Type": "application/json"},
    //   body: jsonEncode(request.toJson()), // ✅ send JSON
    // );

    // if (response.statusCode == 200) {
    //   final json = jsonDecode(response.body) as Map<String, dynamic>;
    //   return LoginResponse.fromJson(json); // ✅ parse JSON
    // } else {
    //   throw Exception("Failed to login: ${response.statusCode}");
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
}
