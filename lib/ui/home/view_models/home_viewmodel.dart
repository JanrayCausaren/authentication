import 'package:authentication_app/data/repositories/courses/courses_repository.dart';
import 'package:authentication_app/domain/models/courses/courses.dart';
import 'package:authentication_app/ui/utils/command.dart';
import 'package:authentication_app/ui/utils/result.dart';
import 'package:flutter/foundation.dart';

/// get all the courses from the repository
class HomeViewmodel extends ChangeNotifier {
  HomeViewmodel({required CoursesRepository coursesRepository})
    : _coursesRepository = coursesRepository {
    getCourses = Command0<void>(_getCourses);
  }

  final CoursesRepository _coursesRepository; 
  late Command0 getCourses;
  List<Courses> _courses = [];
  List<Courses> get courses => _courses;


  Future<Result<void>> _getCourses() async {
    try {
      final resultGetCourses = await _coursesRepository.getCourses();

      switch (resultGetCourses) {
        case Ok<List<Courses>>():
          _courses = resultGetCourses.value;
          print('successful get courses in viewmodel');
          return resultGetCourses;
        case Error<List<Courses>>():
          return Result.error(resultGetCourses.error);
      }
    } finally {
      notifyListeners();
    }
  }
}
