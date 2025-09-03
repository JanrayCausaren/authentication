import 'dart:convert';

import 'package:authentication_app/config/assets.dart';
import 'package:authentication_app/data/services/api/model/courses/courses_api_model.dart';
import 'package:authentication_app/ui/utils/result.dart';
import 'package:flutter/services.dart';

class LocalDataService {
  Future<Result<List<CoursesApiModel>>> getCourses() async {
    final json = await _loadStringAsset(Assets.courses);
    try {
      return Result.ok(
        // json.map<CoursesApiModel>(CoursesApiModel.fromJson).toList(),
        json.map((courseJson) => CoursesApiModel.fromJson(courseJson)).toList(),
      );
    } catch (e) {
      return Result.error(
        throw Exception('Faied to load asset json file : $e'),
      );
    }
  }

  Future<List<Map<String, dynamic>>> _loadStringAsset(String asset) async {
    final localData = await rootBundle.loadString(asset);

    return (jsonDecode(localData) as List).cast<Map<String, dynamic>>();
  }
}
