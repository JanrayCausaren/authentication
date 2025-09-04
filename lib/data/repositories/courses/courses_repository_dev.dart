import 'package:authentication_app/data/repositories/courses/courses_repository.dart';
import 'package:authentication_app/data/services/api/model/courses/courses_api_model.dart';
import 'package:authentication_app/data/services/local/local_data_service.dart';
import 'package:authentication_app/domain/models/courses/courses.dart';
import 'package:authentication_app/ui/utils/result.dart';

class CoursesRepositoryDev extends CoursesRepository {
  CoursesRepositoryDev({required LocalDataService localDataService})
    : _localDataService = localDataService;

  final LocalDataService _localDataService;

  List<Courses>? _cachedCourses;

  @override
  Future<Result<List<Courses>>> getCourses() async {
    try {
      final resultCourses = await _localDataService.getCourses();
      switch (resultCourses) {
        case Ok<List<CoursesApiModel>>():
          final coursesDomain = resultCourses.value.map((apiModel) {
            return Courses(
              id: apiModel.id,
              title: apiModel.title,
              category: apiModel.category,
              thumbnailUrl: apiModel.thumbnailUrl, 
              progress: apiModel.progress,
              status: apiModel.status,
            );
          }).toList();


          print("The result of the course are : $coursesDomain");

          _cachedCourses = coursesDomain;

          print(_cachedCourses);
          return Result.ok(coursesDomain);

        case Error<List<CoursesApiModel>>():
          return Result.error(resultCourses.error);
      }
    } catch (e) {
      return Result.error(Exception('Unexpected error hahaha $e'));
    }
  }
}
