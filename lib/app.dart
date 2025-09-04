import 'package:authentication_app/data/repositories/courses/courses_repository_dev.dart';
import 'package:flutter/material.dart';
import 'package:authentication_app/routing/router.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Authentication',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Poppins',
      ),
      routerConfig: router(context.read()),
    );
  }
}

// late CoursesRepositoryDev courseRepo;

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//      courseRepo = CoursesRepositoryDev(localDataService: context.read());

//     // run async task
//     courseRepo.getCourses().then((result) {
//       print('Courses loaded: $result');
//     });
//   }