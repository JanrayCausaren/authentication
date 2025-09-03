import 'package:authentication_app/domain/models/courses/courses.dart';
import 'package:authentication_app/ui/utils/result.dart';

abstract  class CoursesRepository {

  /// this will get all the courses
  Future<Result<List<Courses>>> getCourses();
}