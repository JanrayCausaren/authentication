import 'package:authentication_app/data/repositories/auth/auth_repository.dart';
import 'package:authentication_app/data/repositories/auth/auth_repository_dev.dart';
import 'package:authentication_app/data/repositories/auth/auth_repository_remote.dart';
import 'package:authentication_app/data/repositories/auth/registration/auth_repository_registration.dart';
import 'package:authentication_app/data/repositories/auth/registration/auth_repository_registration_remote.dart';
import 'package:authentication_app/data/repositories/courses/courses_repository_dev.dart';
import 'package:authentication_app/data/services/api/api_client.dart';
import 'package:authentication_app/data/services/local/local_data_service.dart';
import 'package:authentication_app/data/services/local/secure_storage_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providersLocal {
  return [
    ChangeNotifierProvider.value(value: AuthRepositoryDev() as AuthRepository),
  ];
}

List<SingleChildWidget> get providersRemote {
  return [
    Provider(create: (context) => ApiClientService(host: '192.168.68.118')),
    Provider(create: (context) => SecureStorageService()),
    Provider(create: (context) => LocalDataService()),

    ChangeNotifierProvider(
      create: (context) =>
          AuthRepositoryRemote(
                services: context.read(),
                secureStorageService: context.read(),
              )
              as AuthRepository,
    ),
    ChangeNotifierProvider(
      create: (context) =>
          AuthRepositoryRegistrationRemote(
                services: context.read(),
                secureStorage: context.read(),
              )
              as AuthRepositoryRegistration,
    ),
    Provider(
      create: (context) =>
          CoursesRepositoryDev(localDataService: context.read()),
    ),
  ];
}
