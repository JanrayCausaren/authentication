import 'dart:convert';

import 'package:authentication_app/data/services/api/model/login_request/login_request.dart';
import 'package:authentication_app/data/services/api/model/login_response/login_response.dart';
import 'package:authentication_app/ui/utils/result.dart';
import 'package:http/http.dart' as http;

class Services {
  Services({String? host, int? port})
    : _host = host ?? 'localhost',
      _port = port ?? 3000;

  final String _host;
  final int _port;

  String get _baseURL => "$_host:$_port";

  

  Future<Result<LoginResponse>> login(LoginRequest request) async {
      final endpoint = '/login';
      final url = Uri.parse("http://$_baseURL$endpoint");

      final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()), // ✅ send JSON
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      return Result.ok(LoginResponse.fromJson(json)); // ✅ parse JSON
    } else {
      return  Result.error(throw Exception("Failed to login: ${response.statusCode}"));
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
}
