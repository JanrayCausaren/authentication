import 'package:authentication_app/domain/models/courses/courses.dart';

class CoursesApiModel {
  CoursesApiModel({
    required this.id,
    required this.title,
    required this.category,
    required this.thumbnailUrl,
    required this.progress,
    required this.status,
  });

  final String id;
  final String title;
  final String category;
  final String thumbnailUrl;
  final String progress;
  final String status;

  factory CoursesApiModel.fromJson(Map<String, dynamic> json) {
    return CoursesApiModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      thumbnailUrl: json['thumbnail_url'],
      progress: json['progress'],
      status: json['status'],
    );
  }
}


